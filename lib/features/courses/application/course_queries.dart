import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../content/models/course.dart';
import '../../../core/database/app_database.dart';
import '../../progress/application/lesson_progress_provider.dart';

/// Completion snapshot for a set of lessons.
class CompletionSummary {
  const CompletionSummary(this.completed, this.total);

  final int completed;
  final int total;

  double get fraction => total == 0 ? 0 : completed / total;
}

final levelProvider = FutureProvider.family<Level?, String>((ref, id) async {
  final course = await ref.watch(courseProvider.future);
  for (final level in course.levels) {
    if (level.id == id) return level;
  }
  return null;
});

final moduleProvider = FutureProvider.family<Module?, String>((ref, id) async {
  final course = await ref.watch(courseProvider.future);
  for (final level in course.levels) {
    for (final module in level.modules) {
      if (module.id == id) return module;
    }
  }
  return null;
});

/// Progress across a module's lessons.
final moduleCompletionProvider = Provider.family<CompletionSummary, String>((
  ref,
  moduleId,
) {
  final progress = ref.watch(lessonProgressMapProvider);
  final module = ref.watch(moduleProvider(moduleId)).value;
  if (module == null) return const CompletionSummary(0, 0);
  final completed = module.lessons
      .where((l) => progress[l.id]?.completed == true)
      .length;
  return CompletionSummary(completed, module.lessons.length);
});

/// Progress across an entire level.
final levelCompletionProvider = Provider.family<CompletionSummary, String>((
  ref,
  levelId,
) {
  final progress = ref.watch(lessonProgressMapProvider);
  final level = ref.watch(levelProvider(levelId)).value;
  if (level == null) return const CompletionSummary(0, 0);
  final lessons = level.modules
      .expand((m) => m.lessons)
      .toList(growable: false);
  final completed = lessons
      .where((l) => progress[l.id]?.completed == true)
      .length;
  return CompletionSummary(completed, lessons.length);
});

/// Course-wide completion, used by the dashboard.
final courseCompletionProvider = Provider<CompletionSummary>((ref) {
  final progress = ref.watch(lessonProgressMapProvider);
  final course = ref.watch(courseProvider).value;
  if (course == null) return const CompletionSummary(0, 0);
  final lessons = course.levels
      .expand((l) => l.modules)
      .expand((m) => m.lessons)
      .toList(growable: false);
  final completed = lessons
      .where((l) => progress[l.id]?.completed == true)
      .length;
  return CompletionSummary(completed, lessons.length);
});

/// True when the lesson has been opened but not finished — used to choose
/// between "Start" and "Resume" copy.
final lessonStartedProvider = Provider.family<bool, String>(
  (ref, lessonId) =>
      ref.watch(lessonProgressMapProvider)[lessonId]?.completed == false,
);

/// The next lesson to study: most recently touched in-progress lesson, else
/// the first incomplete lesson in course order.
final nextLessonProvider = Provider<({LessonRef lesson, String moduleTitle})?>((
  ref,
) {
  final course = ref.watch(courseProvider).value;
  final progress = ref.watch(lessonProgressListProvider).value;
  if (course == null) return null;

  LessonRef? find(String lessonId) {
    for (final level in course.levels) {
      for (final module in level.modules) {
        for (final lesson in module.lessons) {
          if (lesson.id == lessonId) return lesson;
        }
      }
    }
    return null;
  }

  String? moduleOf(String lessonId) {
    for (final level in course.levels) {
      for (final module in level.modules) {
        if (module.lessons.any((l) => l.id == lessonId)) return module.title;
      }
    }
    return null;
  }

  if (progress != null) {
    final inProgress = progress.where((p) => !p.completed).toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    for (final p in inProgress) {
      final lesson = find(p.lessonId);
      final module = moduleOf(p.lessonId);
      if (lesson != null && module != null) {
        return (lesson: lesson, moduleTitle: module);
      }
    }
  }

  final completedIds = {
    for (final p in progress ?? const <LessonProgressTableData>[])
      if (p.completed) p.lessonId,
  };
  for (final level in course.levels) {
    for (final module in level.modules) {
      for (final lesson in module.lessons) {
        if (!completedIds.contains(lesson.id)) {
          return (lesson: lesson, moduleTitle: module.title);
        }
      }
    }
  }
  return null;
});
