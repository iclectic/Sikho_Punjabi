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
