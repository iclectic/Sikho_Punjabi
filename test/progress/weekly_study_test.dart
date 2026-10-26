import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sikho_punjabi/features/progress/application/study_stats_provider.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

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

  test('sessions bucket into the last 7 days, today at index 6', () async {
    final now = DateTime.now();
    // Calendar arithmetic — subtracting a Duration crosses DST boundaries.
    await db.logStudySession(startedAt: now, durationSeconds: 60);
    await db.logStudySession(
      startedAt: DateTime(now.year, now.month, now.day - 2, 12),
      durationSeconds: 30,
    );
    await db.logStudySession(
      startedAt: DateTime(now.year, now.month, now.day - 10, 12),
      durationSeconds: 999,
    );

    final sub = container.listen(studySessionsProvider, (_, _) {});
    addTearDown(sub.close);
    await container.read(studySessionsProvider.future);

    final days = container.read(weeklyStudySecondsProvider);
    expect(days[6], 60);
    expect(days[4], 30);
    expect(days.fold<int>(0, (s, n) => s + n), 90); // 10-day-old excluded
  });
}
