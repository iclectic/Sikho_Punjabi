import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/models/lesson.dart';
import '../../../core/database/app_database.dart';
import '../domain/srs_scheduler.dart';

/// Watches cards due for review right now.
final dueFlashcardsProvider = StreamProvider<List<FlashcardsTableData>>((ref) {
  return ref.watch(appDatabaseProvider).watchDueFlashcards(DateTime.now());
});

final dueFlashcardCountProvider = Provider<int>(
  (ref) => ref.watch(dueFlashcardsProvider).value?.length ?? 0,
);

/// Seeds flashcards from a lesson's vocabulary sections. Idempotent — the
/// flashcard id is derived from the vocabulary item id.
Future<void> seedFlashcardsFromLesson(AppDatabase db, Lesson lesson) async {
  final cards = <FlashcardsTableCompanion>[];
  for (final section in lesson.sections) {
    if (section is! VocabularySection) continue;
    for (final item in section.items) {
      cards.add(
        FlashcardsTableCompanion.insert(
          id: item.id,
          lessonId: lesson.id,
          gurmukhi: item.term.gurmukhi,
          romanised: Value(item.term.romanised),
          english: Value(item.term.english),
          audioRef: Value(item.term.audioRef),
          dueAt: DateTime.now(),
          createdAt: DateTime.now(),
        ),
      );
    }
  }
  if (cards.isNotEmpty) await db.insertFlashcards(cards);
}

/// Applies a self-rating to a card and persists the new schedule + record.
class ReviewActions {
  ReviewActions(this._db, [this._scheduler = const SrsScheduler()]);

  final AppDatabase _db;
  final SrsScheduler _scheduler;

  Future<void> rate(FlashcardsTableData card, ReviewRating rating) async {
    final now = DateTime.now();
    final next = _scheduler.schedule(
      rating: rating,
      easeFactor: card.easeFactor,
      intervalDays: card.intervalDays,
      repetitions: card.repetitions,
      now: now,
    );
    await _db.updateFlashcardSchedule(
      card.id,
      easeFactor: next.easeFactor,
      intervalDays: next.intervalDays,
      repetitions: next.repetitions,
      dueAt: next.dueAt,
      lastReviewedAt: now,
    );
    await _db.recordReview(card.id, rating.value);
  }
}

final reviewActionsProvider = Provider<ReviewActions>(
  (ref) => ReviewActions(ref.watch(appDatabaseProvider)),
);
