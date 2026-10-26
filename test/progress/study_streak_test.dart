import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/features/progress/domain/study_streak.dart';

void main() {
  final today = DateTime(2026, 10, 26, 15);

  // Calendar arithmetic (day - n), not Duration subtraction — 24h steps
  // break across daylight saving transitions.
  DateTime at(int daysAgo, {int hour = 9}) =>
      DateTime(today.year, today.month, today.day - daysAgo, hour);

  group('computeStudyStreak', () {
    test('empty sessions → 0', () {
      expect(computeStudyStreak(const [], today), 0);
    });

    test('studied today only → streak 1', () {
      expect(computeStudyStreak([at(0)], today), 1);
    });

    test('consecutive days including today', () {
      expect(computeStudyStreak([at(0), at(1), at(2)], today), 3);
    });

    test('streak ending yesterday still counts (not broken mid-day)', () {
      expect(computeStudyStreak([at(1), at(2), at(3)], today), 3);
    });

    test('a gap breaks the streak', () {
      expect(computeStudyStreak([at(0), at(1), at(3), at(4)], today), 2);
    });

    test('old sessions with no recent activity → 0', () {
      expect(computeStudyStreak([at(5), at(6)], today), 0);
    });

    test('multiple sessions same day count once', () {
      expect(
        computeStudyStreak([at(0, hour: 8), at(0, hour: 20), at(1)], today),
        2,
      );
    });
  });
}
