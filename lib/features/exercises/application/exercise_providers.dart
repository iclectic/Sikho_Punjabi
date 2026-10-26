import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';

/// Latest correctness per exercise id for a lesson — `exerciseId → correct`.
final exerciseResultsProvider =
    StreamProvider.family<Map<String, bool>, String>(
      (ref, lessonId) => ref
          .watch(appDatabaseProvider)
          .watchExerciseResults(lessonId)
          .map((rows) => {for (final r in rows) r.exerciseId: r.correct}),
    );

/// True when every exercise in [exerciseIds] has a stored `correct` result.
/// Lessons with no exercises are complete by definition.
final allExercisesCorrectProvider =
    Provider.family<bool, ({String lessonId, List<String> exerciseIds})>((
      ref,
      args,
    ) {
      if (args.exerciseIds.isEmpty) return true;
      final results =
          ref.watch(exerciseResultsProvider(args.lessonId)).value ?? const {};
      return args.exerciseIds.every((id) => results[id] == true);
    });
