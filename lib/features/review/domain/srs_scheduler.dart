/// Self-rating for a reviewed flashcard.
enum ReviewRating {
  again(0),
  hard(1),
  good(2),
  easy(3);

  const ReviewRating(this.value);
  final int value;

  static ReviewRating fromValue(int value) =>
      ReviewRating.values.firstWhere((r) => r.value == value);
}

/// Current scheduling state of a card.
class SrsState {
  const SrsState({
    required this.easeFactor,
    required this.intervalDays,
    required this.repetitions,
    required this.dueAt,
  });

  final double easeFactor;
  final int intervalDays;
  final int repetitions;
  final DateTime dueAt;
}

/// SM-2-derived scheduling, simplified for MVP (a later FSRS upgrade should
/// keep the same inputs/outputs). Pure and deterministic for testability.
class SrsScheduler {
  const SrsScheduler();

  static const double minEase = 1.3;
  static const double defaultEase = 2.5;

  /// Intervals (days) while a card is still in the learning phase.
  static const List<int> learningSteps = [1, 3];

  static const _easeDeltas = {
    ReviewRating.again: -0.20,
    ReviewRating.hard: -0.15,
    ReviewRating.good: 0.0,
    ReviewRating.easy: 0.15,
  };

  SrsState schedule({
    required ReviewRating rating,
    required double easeFactor,
    required int intervalDays,
    required int repetitions,
    required DateTime now,
  }) {
    final ease = (easeFactor + _easeDeltas[rating]!).clamp(minEase, 3.0);

    if (rating == ReviewRating.again) {
      return SrsState(
        easeFactor: ease,
        intervalDays: learningSteps.first,
        repetitions: 0,
        dueAt: now.add(Duration(days: learningSteps.first)),
      );
    }

    final nextReps = repetitions + 1;
    final interval = switch ((repetitions, rating)) {
      (0, _) => learningSteps.first,
      (1, _) => learningSteps[1],
      (_, ReviewRating.hard) => (intervalDays * 1.2).round(),
      (_, ReviewRating.easy) => (intervalDays * ease * 1.3).round(),
      _ => (intervalDays * ease).round(),
    };

    return SrsState(
      easeFactor: ease,
      intervalDays: interval,
      repetitions: nextReps,
      dueAt: now.add(Duration(days: interval)),
    );
  }
}
