import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sikho_punjabi/features/review/application/review_providers.dart';
import 'package:sikho_punjabi/features/review/domain/srs_scheduler.dart';
import 'package:sikho_punjabi/features/vocabulary/application/vocabulary_providers.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  FlashcardsTableCompanion card(String id, DateTime dueAt) =>
      FlashcardsTableCompanion.insert(
        id: id,
        lessonId: 'l1',
        gurmukhi: 'ਹਾਂ',
        dueAt: dueAt,
        createdAt: DateTime.now(),
      );

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
    );
  });

  tearDown(() {
    container.dispose();
    db.close();
  });

  group('reviewStatsProvider', () {
    test('counts ratings and computes recall rate', () async {
      await db.recordReview('v1', ReviewRating.good.value);
      await db.recordReview('v1', ReviewRating.easy.value);
      await db.recordReview('v2', ReviewRating.again.value);
      await db.recordReview('v2', ReviewRating.hard.value);

      // Keep a subscription alive so the drift stream actually emits.
      final sub = container.listen(reviewRecordsProvider, (_, _) {});
      addTearDown(sub.close);
      await container.read(reviewRecordsProvider.future);

      final result = container.read(reviewStatsProvider);
      expect(result.total, 4);
      expect(result.byRating[ReviewRating.good], 1);
      expect(result.byRating[ReviewRating.again], 1);
      expect(result.successRate, 0.5);
    });
  });

  group('dueForecastProvider', () {
    test('overdue counts as today; future days land in their slot', () async {
      final now = DateTime.now();
      await db.insertFlashcards([
        card('overdue', now.subtract(const Duration(days: 2))),
        card('today', now),
        card('tomorrow', now.add(const Duration(days: 1))),
        card('in3', now.add(const Duration(days: 3))),
        card('farFuture', now.add(const Duration(days: 30))),
      ]);

      final sub = container.listen(allFlashcardsProvider, (_, _) {});
      addTearDown(sub.close);
      await container.read(allFlashcardsProvider.future);
      final forecast = container.read(dueForecastProvider);

      expect(forecast[0], 2); // overdue + today
      expect(forecast[1], 1); // tomorrow
      expect(forecast[3], 1); // in 3 days
      expect(forecast.fold<int>(0, (s, n) => s + n), 4); // 30-day card excluded
    });
  });
}
