import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../domain/study_streak.dart';

class StudyStats {
  const StudyStats({
    required this.streak,
    required this.totalSeconds,
    required this.daysStudied,
  });

  final int streak;
  final int totalSeconds;
  final int daysStudied;

  static const empty = StudyStats(streak: 0, totalSeconds: 0, daysStudied: 0);
}

final studySessionsProvider = StreamProvider<List<StudySessionsTableData>>(
  (ref) => ref.watch(appDatabaseProvider).watchStudySessions(),
);

/// Study seconds for each of the last 7 days — index 6 is today.
/// Backs the weekly bar chart on the Progress tab.
final weeklyStudySecondsProvider = Provider<List<int>>((ref) {
  final sessions =
      ref.watch(studySessionsProvider).value ??
      const <StudySessionsTableData>[];
  final days = List<int>.filled(7, 0);
  final now = DateTime.now();
  final startOfToday = DateTime(now.year, now.month, now.day);
  for (final session in sessions) {
    final s = session.startedAt;
    // Normalise to calendar dates — Duration.inDays truncates toward zero,
    // which misplaces sessions from earlier today-time in previous days.
    final day =
        DateTime(s.year, s.month, s.day).difference(startOfToday).inDays + 6;
    if (day >= 0 && day < days.length) {
      days[day] += session.durationSeconds;
    }
  }
  return days;
});

final studyStatsProvider = Provider<StudyStats>((ref) {
  final sessions = ref.watch(studySessionsProvider).value;
  if (sessions == null || sessions.isEmpty) return StudyStats.empty;

  final days = sessions
      .map(
        (s) => DateTime(s.startedAt.year, s.startedAt.month, s.startedAt.day),
      )
      .toSet()
      .length;

  return StudyStats(
    streak: computeStudyStreak(
      sessions.map((s) => s.startedAt),
      DateTime.now(),
    ),
    totalSeconds: sessions.fold<int>(0, (sum, s) => sum + s.durationSeconds),
    daysStudied: days,
  );
});
