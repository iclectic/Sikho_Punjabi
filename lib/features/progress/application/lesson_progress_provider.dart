import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';

/// Live view of all per-lesson progress rows.
final lessonProgressListProvider =
    StreamProvider<List<LessonProgressTableData>>(
      (ref) => ref.watch(appDatabaseProvider).watchAllLessonProgress(),
    );

/// The same data indexed by lesson id — the shape screens actually want.
final lessonProgressMapProvider =
    Provider<Map<String, LessonProgressTableData>>(
      (ref) => {
        for (final p
            in ref.watch(lessonProgressListProvider).value ??
                const <LessonProgressTableData>[])
          p.lessonId: p,
      },
    );
