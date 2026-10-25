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

@DriftDatabase(
  tables: [
    LessonProgressTable,
    FlashcardsTable,
    ReviewRecordsTable,
    StudySessionsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'sikho_punjabi'));

  @override
  int get schemaVersion => 1;

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
