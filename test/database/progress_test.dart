import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sikho_punjabi/features/review/application/review_providers.dart';
import 'package:sikho_punjabi/features/review/domain/srs_scheduler.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  group('lesson progress', () {
    test('position is saved and resumable', () async {
      await db.saveLessonPosition('l1', 3);
      final progress = await db.lessonProgress('l1');
      expect(progress?.lastSectionIndex, 3);
      expect(progress?.completed, isFalse);
    });

    test('completion marks completed without losing position', () async {
      await db.saveLessonPosition('l1', 2);
      await db.markLessonCompleted('l1');
      final progress = await db.lessonProgress('l1');
      expect(progress?.completed, isTrue);
      expect(progress?.completedAt, isNotNull);
    });
  });

  group('exercise results', () {
    test('latest result wins and streams per lesson', () async {
      await db.saveExerciseResult(
        lessonId: 'l1',
        exerciseId: 'e1',
        correct: false,
      );
      await db.saveExerciseResult(
        lessonId: 'l1',
        exerciseId: 'e1',
        correct: true,
      );
      await db.saveExerciseResult(
        lessonId: 'l2',
        exerciseId: 'e9',
        correct: true,
      );

      final l1 = await db.watchExerciseResults('l1').first;
      expect(l1.single.exerciseId, 'e1');
      expect(l1.single.correct, isTrue);
    });
  });

  group('vocabulary browsing', () {
    FlashcardsTableCompanion card(String id) => FlashcardsTableCompanion.insert(
      id: id,
      lessonId: 'l1',
      gurmukhi: 'ਹਾਂ',
      dueAt: DateTime.now().subtract(const Duration(days: 1)),
      createdAt: DateTime.now(),
    );

    test('watchAllFlashcards streams all cards', () async {
      await db.insertFlashcards([card('v1'), card('v2')]);
      final cards = await db.watchAllFlashcards().first;
      expect(cards.map((c) => c.id), ['v1', 'v2']);
    });

    test('resetFlashcard returns a card to fresh scheduling', () async {
      await db.insertFlashcards([card('v1')]);
      final c = (await db.dueFlashcards(DateTime.now())).single;
      await ReviewActions(db).rate(c, ReviewRating.easy);

      await db.resetFlashcard('v1');
      final reset = (await db.watchAllFlashcards().first).single;
      expect(reset.repetitions, 0);
      expect(reset.intervalDays, 0);
      expect(reset.easeFactor, 2.5);
      expect(reset.lastReviewedAt, isNull);
      expect(reset.dueAt.isBefore(DateTime.now()), isTrue);
    });
  });

  group('flashcard review flow', () {
    test('rating a card updates schedule and writes a record', () async {
      await db.insertFlashcards([
        FlashcardsTableCompanion.insert(
          id: 'v1',
          lessonId: 'l1',
          gurmukhi: 'ਹਾਂ',
          dueAt: DateTime.now().subtract(const Duration(days: 1)),
          createdAt: DateTime.now(),
        ),
      ]);

      final card = (await db.dueFlashcards(DateTime.now())).single;
      await ReviewActions(db).rate(card, ReviewRating.good);

      final updated = await db.dueFlashcards(DateTime.now());
      expect(updated, isEmpty, reason: 'card should be rescheduled to future');

      final records = await db.select(db.reviewRecordsTable).get();
      expect(records.single.flashcardId, 'v1');
      expect(records.single.rating, ReviewRating.good.value);
    });
  });
}
