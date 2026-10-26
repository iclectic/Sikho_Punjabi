import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/models/lesson.dart';
import '../../../core/database/app_database.dart';
import '../../vocabulary/application/vocabulary_providers.dart';
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

/// Aggregate review statistics across all time.
class ReviewStats {
  const ReviewStats({required this.total, required this.byRating});

  final int total;
  final Map<ReviewRating, int> byRating;

  /// Share of ratings that were Good or Easy — a rough recall proxy.
  double get successRate => total == 0
      ? 0
      : ((byRating[ReviewRating.good] ?? 0) +
                (byRating[ReviewRating.easy] ?? 0)) /
            total;
}

final reviewStatsProvider = Provider<ReviewStats>((ref) {
  final records =
      ref.watch(reviewRecordsProvider).value ??
      const <ReviewRecordsTableData>[];
  final byRating = <ReviewRating, int>{};
  for (final record in records) {
    final rating = ReviewRating.fromValue(record.rating);
    byRating[rating] = (byRating[rating] ?? 0) + 1;
  }
  return ReviewStats(total: records.length, byRating: byRating);
});

/// Every recorded self-rating, newest first.
final reviewRecordsProvider = StreamProvider<List<ReviewRecordsTableData>>(
  (ref) => ref.watch(appDatabaseProvider).watchReviewRecords(),
);

/// Cards becoming due over the next 7 days, indexed by offset from today.
/// Index 0 includes everything already overdue.
final dueForecastProvider = Provider<List<int>>((ref) {
  final cards =
      ref.watch(allFlashcardsProvider).value ?? const <FlashcardsTableData>[];
  final counts = List<int>.filled(7, 0);
  final today = DateTime.now();
  final startOfToday = DateTime(today.year, today.month, today.day);
  for (final card in cards) {
    var day = card.dueAt.difference(startOfToday).inDays;
    if (day < 0) day = 0; // overdue counts as today
    if (day < counts.length) counts[day]++;
  }
  return counts;
});
