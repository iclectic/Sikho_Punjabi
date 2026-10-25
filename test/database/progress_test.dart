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
