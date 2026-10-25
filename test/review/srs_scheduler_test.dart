import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/features/review/domain/srs_scheduler.dart';

void main() {
  const scheduler = SrsScheduler();
  final now = DateTime(2026, 10, 24, 12);

  SrsState scheduleNew(ReviewRating rating) => scheduler.schedule(
    rating: rating,
    easeFactor: SrsScheduler.defaultEase,
    intervalDays: 0,
    repetitions: 0,
    now: now,
  );

  group('SrsScheduler', () {
    test('a new card rated good graduates at step 1', () {
      final next = scheduleNew(ReviewRating.good);
      expect(next.intervalDays, SrsScheduler.learningSteps.first);
      expect(next.repetitions, 1);
      expect(next.dueAt, now.add(const Duration(days: 1)));
    });

    test('again resets repetitions and requeues at first step', () {
      final next = scheduler.schedule(
        rating: ReviewRating.again,
        easeFactor: 2.5,
        intervalDays: 10,
        repetitions: 5,
        now: now,
      );
      expect(next.repetitions, 0);
      expect(next.intervalDays, SrsScheduler.learningSteps.first);
      expect(next.easeFactor, lessThan(2.5));
    });

    test('ease factor never drops below minimum', () {
      var ease = SrsScheduler.minEase;
      for (var i = 0; i < 10; i++) {
        ease = scheduler
            .schedule(
              rating: ReviewRating.again,
              easeFactor: ease,
              intervalDays: 0,
              repetitions: 0,
              now: now,
            )
            .easeFactor;
      }
      expect(ease, SrsScheduler.minEase);
    });

    test('graduated cards grow interval by ease factor', () {
      final state = scheduler.schedule(
        rating: ReviewRating.good,
        easeFactor: 2.5,
        intervalDays: 6,
        repetitions: 3,
        now: now,
      );
      expect(state.intervalDays, 15);
    });

    test('easy accelerates faster than good', () {
      final good = scheduler.schedule(
        rating: ReviewRating.good,
        easeFactor: 2.5,
        intervalDays: 6,
        repetitions: 3,
        now: now,
      );
      final easy = scheduler.schedule(
        rating: ReviewRating.easy,
        easeFactor: 2.5,
        intervalDays: 6,
        repetitions: 3,
        now: now,
      );
      expect(easy.intervalDays, greaterThan(good.intervalDays));
    });
  });
}
