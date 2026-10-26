import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_database.g.dart';

/// Per-lesson resume + completion state.
class LessonProgressTable extends Table {
  TextColumn get lessonId => text()();
  IntColumn get lastSectionIndex => integer().withDefault(const Constant(0))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {lessonId};
}

/// Vocabulary lifted out of lessons into the review system. Scheduling fields
/// follow an SM-2-style scheme implemented by `SrsScheduler`.
class FlashcardsTable extends Table {
  TextColumn get id => text()();
  TextColumn get lessonId => text()();
  TextColumn get gurmukhi => text()();
  TextColumn get romanised => text().nullable()();
  TextColumn get english => text().nullable()();
  TextColumn get audioRef => text().nullable()();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get intervalDays => integer().withDefault(const Constant(0))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  DateTimeColumn get dueAt => dateTime()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// One rating event per review; powers history and future analytics.
class ReviewRecordsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get flashcardId => text().references(FlashcardsTable, #id)();
  IntColumn get rating => integer()();
  DateTimeColumn get reviewedAt => dateTime()();
}

/// Lightweight study sessions for streaks + total study time.
class StudySessionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lessonId => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
}

/// Latest answer state per exercise, per lesson. One row per
/// (lessonId, exerciseId) — the most recent attempt overwrites the last.
class ExerciseResultsTable extends Table {
  TextColumn get lessonId => text()();
  TextColumn get exerciseId => text()();
  BoolColumn get correct => boolean()();
  DateTimeColumn get answeredAt => dateTime()();

  @override
  Set<Column> get primaryKey => {lessonId, exerciseId};
}

@DriftDatabase(
  tables: [
    LessonProgressTable,
    FlashcardsTable,
    ReviewRecordsTable,
    StudySessionsTable,
    ExerciseResultsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'sikho_punjabi'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(exerciseResultsTable);
      }
    },
  );

  // ---- Lesson progress ----

  Future<LessonProgressTableData?> lessonProgress(String lessonId) => (select(
    lessonProgressTable,
  )..where((t) => t.lessonId.equals(lessonId))).getSingleOrNull();

  Stream<List<LessonProgressTableData>> watchAllLessonProgress() =>
      select(lessonProgressTable).watch();

  Future<void> saveLessonPosition(String lessonId, int sectionIndex) {
    return into(lessonProgressTable).insertOnConflictUpdate(
      LessonProgressTableCompanion.insert(
        lessonId: lessonId,
        lastSectionIndex: Value(sectionIndex),
        updatedAt: DateTime.now(),
      ),
    );
  }

  Future<void> markLessonCompleted(String lessonId) {
    return into(lessonProgressTable).insertOnConflictUpdate(
      LessonProgressTableCompanion.insert(
        lessonId: lessonId,
        completed: const Value(true),
        completedAt: Value(DateTime.now()),
        updatedAt: DateTime.now(),
      ),
    );
  }

  // ---- Flashcards ----

  Future<void> insertFlashcards(List<FlashcardsTableCompanion> cards) =>
      batch((b) => b.insertAllOnConflictUpdate(flashcardsTable, cards));

  /// Cards whose review is due at or before [now].
  Stream<List<FlashcardsTableData>> watchDueFlashcards(DateTime now) => (select(
    flashcardsTable,
  )..where((t) => t.dueAt.isSmallerOrEqualValue(now))).watch();

  Future<List<FlashcardsTableData>> dueFlashcards(DateTime now) => (select(
    flashcardsTable,
  )..where((t) => t.dueAt.isSmallerOrEqualValue(now))).get();

  /// Every card, oldest first — the vocabulary browser's source.
  Stream<List<FlashcardsTableData>> watchAllFlashcards() => (select(
    flashcardsTable,
  )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).watch();

  /// Resets a card's scheduling state to a fresh card due immediately.
  Future<void> resetFlashcard(String id) =>
      (update(flashcardsTable)..where((t) => t.id.equals(id))).write(
        FlashcardsTableCompanion(
          easeFactor: const Value(2.5),
          intervalDays: const Value(0),
          repetitions: const Value(0),
          dueAt: Value(DateTime.now()),
          lastReviewedAt: const Value(null),
        ),
      );

  /// How many ratings this card has received.
  Future<int> reviewCountFor(String flashcardId) =>
      (select(reviewRecordsTable)
            ..where((t) => t.flashcardId.equals(flashcardId)))
          .get()
          .then((rows) => rows.length);

  Future<void> updateFlashcardSchedule(
    String id, {
    required double easeFactor,
    required int intervalDays,
    required int repetitions,
    required DateTime dueAt,
    required DateTime lastReviewedAt,
  }) {
    return (update(flashcardsTable)..where((t) => t.id.equals(id))).write(
      FlashcardsTableCompanion(
        easeFactor: Value(easeFactor),
        intervalDays: Value(intervalDays),
        repetitions: Value(repetitions),
        dueAt: Value(dueAt),
        lastReviewedAt: Value(lastReviewedAt),
      ),
    );
  }

  Future<void> recordReview(String flashcardId, int rating) =>
      into(reviewRecordsTable).insert(
        ReviewRecordsTableCompanion.insert(
          flashcardId: flashcardId,
          rating: rating,
          reviewedAt: DateTime.now(),
        ),
      );

  // ---- Exercise results ----

  Stream<List<ExerciseResultsTableData>> watchExerciseResults(
    String lessonId,
  ) => (select(
    exerciseResultsTable,
  )..where((t) => t.lessonId.equals(lessonId))).watch();

  Future<void> saveExerciseResult({
    required String lessonId,
    required String exerciseId,
    required bool correct,
  }) => into(exerciseResultsTable).insertOnConflictUpdate(
    ExerciseResultsTableCompanion.insert(
      lessonId: lessonId,
      exerciseId: exerciseId,
      correct: correct,
      answeredAt: DateTime.now(),
    ),
  );

  // ---- Study sessions ----

  Future<int> logStudySession({
    String? lessonId,
    required DateTime startedAt,
    required int durationSeconds,
  }) => into(studySessionsTable).insert(
    StudySessionsTableCompanion.insert(
      lessonId: Value(lessonId),
      startedAt: startedAt,
      durationSeconds: Value(durationSeconds),
    ),
  );

  Stream<List<StudySessionsTableData>> watchStudySessions() =>
      select(studySessionsTable).watch();
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
