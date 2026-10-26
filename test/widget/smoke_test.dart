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

void main() {
  testWidgets('app boots to Learn tab with course content', (tester) async {
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

    expect(find.text('Continue learning'), findsOneWidget);
    expect(find.text('Hello and goodbye'), findsWidgets);
    expect(find.text('Review'), findsWidgets);
  });
}
