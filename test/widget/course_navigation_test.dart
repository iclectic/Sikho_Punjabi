import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikho_punjabi/app/app.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sikho_punjabi/core/prefs/preferences_provider.dart';
import 'package:sikho_punjabi/features/progress/application/lesson_progress_provider.dart';
import 'package:sikho_punjabi/features/progress/application/study_stats_provider.dart';
import 'package:sikho_punjabi/features/review/application/review_providers.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'onboarding.completed': true});
    final prefs = await SharedPreferences.getInstance();
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          appDatabaseProvider.overrideWithValue(db),
          lessonProgressListProvider.overrideWith(
            (ref) => Stream.value(const <LessonProgressTableData>[]),
          ),
          dueFlashcardsProvider.overrideWith(
            (ref) => Stream.value(const <FlashcardsTableData>[]),
          ),
          studySessionsProvider.overrideWith(
            (ref) => Stream.value(const <StudySessionsTableData>[]),
          ),
        ],
        child: const SikhoPunjabiApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('dashboard → course → level → module → lesson', (tester) async {
    // Taller surface so cards aren't hidden behind the bottom nav bar.
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await pumpApp(tester);

    // Dashboard → course overview
    await tester.ensureVisible(find.text('Browse the full course'));
    await tester.tap(find.text('Browse the full course'));
    await tester.pumpAndSettle();
    expect(find.text('Level 1 · Absolute Beginner'), findsOneWidget);

    // Course → level
    await tester.ensureVisible(find.text('Level 1 · Absolute Beginner'));
    await tester.tap(find.text('Level 1 · Absolute Beginner'));
    await tester.pumpAndSettle();
    expect(find.text('First words'), findsWidgets);

    // Level → module
    await tester.ensureVisible(find.byType(Card).first);
    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();
    expect(find.text('Hello and goodbye'), findsWidgets);
    expect(find.text('Introducing yourself'), findsOneWidget);

    // Module → lesson player
    await tester.ensureVisible(find.text('Hello and goodbye'));
    await tester.tap(find.text('Hello and goodbye'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome'), findsOneWidget);
  });
}
