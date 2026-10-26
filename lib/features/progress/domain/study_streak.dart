/// A streak counts consecutive calendar days with at least one study session,
/// ending today or yesterday. Missing today hasn't broken the streak yet —
/// we don't punish learners mid-day.
///
/// Uses calendar arithmetic (`DateTime(year, month, day - n)`), never fixed
/// 24-hour durations — daylight saving transitions make days longer or
/// shorter than 24 hours.
int computeStudyStreak(Iterable<DateTime> sessionStarts, DateTime now) {
  final days = sessionStarts
      .map((d) => DateTime(d.year, d.month, d.day))
      .toSet();
  if (days.isEmpty) return 0;

  var cursor = DateTime(now.year, now.month, now.day);
  if (!days.contains(cursor)) {
    cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
    if (!days.contains(cursor)) return 0;
  }

  var streak = 0;
  while (days.contains(cursor)) {
    streak++;
    cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
  }
  return streak;
}
