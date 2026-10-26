import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/core/database/app_database.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

/// Builds a schema-version-1 database (no exercise_results_table) on a raw
/// sqlite3 connection, then hands it to AppDatabase which must run the
/// v2 migration — exercising the real migration path.
void main() {
  test(
    'v1 → v2 migration preserves data and creates exercise results',
    () async {
      final raw = sqlite3.sqlite3.openInMemory();

      // Recreate the v1 schema — everything except exercise_results_table.
      const v1Ddl = [
        '''CREATE TABLE lesson_progress_table (
        lesson_id TEXT NOT NULL PRIMARY KEY,
        last_section_index INTEGER NOT NULL DEFAULT 0,
        completed INTEGER NOT NULL DEFAULT 0,
        updated_at INTEGER NOT NULL
      )''',
        '''CREATE TABLE flashcards_table (
        id TEXT NOT NULL PRIMARY KEY,
        lesson_id TEXT NOT NULL,
        gurmukhi TEXT NOT NULL,
        romanised TEXT,
        english TEXT,
        audio_ref TEXT,
        ease_factor REAL NOT NULL DEFAULT 2.5,
        interval_days INTEGER NOT NULL DEFAULT 0,
        repetitions INTEGER NOT NULL DEFAULT 0,
        due_at INTEGER NOT NULL,
        last_reviewed_at INTEGER,
        created_at INTEGER NOT NULL
      )''',
        '''CREATE TABLE review_records_table (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        flashcard_id TEXT NOT NULL,
        rating INTEGER NOT NULL,
        reviewed_at INTEGER NOT NULL
      )''',
        '''CREATE TABLE study_sessions_table (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        lesson_id TEXT,
        started_at INTEGER NOT NULL,
        duration_seconds INTEGER NOT NULL DEFAULT 0
      )''',
      ];
      for (final ddl in v1Ddl) {
        raw.execute(ddl);
      }
      // A v1 user's data that must survive the upgrade.
      raw.execute(
        'INSERT INTO lesson_progress_table '
        '(lesson_id, last_section_index, completed, updated_at) '
        "VALUES ('l1', 2, 0, 1700000000000)",
      );
      raw.execute('PRAGMA user_version = 1');

      // Attaching the app database triggers onUpgrade → creates the new table.
      final db = AppDatabase(NativeDatabase.opened(raw));
      addTearDown(db.close);

      final progress = await db.lessonProgress('l1');
      expect(progress, isNotNull, reason: 'v1 data must survive migration');
      expect(progress!.lastSectionIndex, 2);

      await db.saveExerciseResult(
        lessonId: 'l1',
        exerciseId: 'e1',
        correct: true,
      );
      final results = await db.watchExerciseResults('l1').first;
      expect(results.single.correct, isTrue);
    },
  );
}
