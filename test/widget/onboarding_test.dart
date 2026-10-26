import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikho_punjabi/app/app.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sikho_punjabi/core/prefs/preferences_provider.dart';
import 'package:sikho_punjabi/features/progress/application/lesson_progress_provider.dart';
import 'package:sikho_punjabi/features/progress/application/study_stats_provider.dart';
import 'package:sikho_punjabi/features/review/application/review_providers.dart';
import 'package:sikho_punjabi/features/vocabulary/application/vocabulary_providers.dart';

void main() {
  Future<SharedPreferences> pumpApp(
    WidgetTester tester, {
    required Map<String, Object> prefs,
  }) async {
    SharedPreferences.setMockInitialValues(prefs);
    final instance = await SharedPreferences.getInstance();
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(instance),
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
          allFlashcardsProvider.overrideWith(
            (ref) => Stream.value(const <FlashcardsTableData>[]),
          ),
        ],
        child: const SikhoPunjabiApp(),
      ),
    );
    await tester.pumpAndSettle();
    return instance;
  }

  testWidgets('first run shows onboarding', (tester) async {
    await pumpApp(tester, prefs: {});
    expect(find.text('Learn Punjabi properly'), findsOneWidget);
  });

  testWidgets('completed onboarding flag boots straight to Learn', (
    tester,
  ) async {
    await pumpApp(tester, prefs: {'onboarding.completed': true});
    expect(find.text('Continue learning'), findsOneWidget);
  });
}
