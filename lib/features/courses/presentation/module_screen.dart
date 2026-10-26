import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../content/models/course.dart';
import '../../../core/theme/app_tokens.dart';
import '../../progress/application/lesson_progress_provider.dart';
import '../application/course_queries.dart';

/// Module detail — its lessons with per-lesson state.
class ModuleScreen extends ConsumerWidget {
  const ModuleScreen({required this.moduleId, super.key});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final module = ref.watch(moduleProvider(moduleId));
    final progress = ref.watch(lessonProgressMapProvider);

    return Scaffold(
      appBar: AppBar(title: Text(module.value?.title ?? 'Module')),
      body: module.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load module: $e')),
        data: (module) => module == null
            ? const Center(child: Text('Module not found.'))
            : ListView(
                padding: AppSpacing.screenPadding,
                children: [
                  if (module.description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: Text(
                        module.description!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  for (var i = 0; i < module.lessons.length; i++)
                    _LessonTile(
                      index: i + 1,
                      lesson: module.lessons[i],
                      completed:
                          progress[module.lessons[i].id]?.completed == true,
                      started:
                          progress[module.lessons[i].id] != null &&
                          progress[module.lessons[i].id]!.completed == false,
                    ),
                ],
              ),
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({
    required this.index,
    required this.lesson,
    required this.completed,
    required this.started,
  });

  final int index;
  final LessonRef lesson;
  final bool completed;
  final bool started;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: completed
              ? scheme.primary
              : scheme.surfaceContainerHighest,
          foregroundColor: completed
              ? scheme.onPrimary
              : scheme.onSurfaceVariant,
          child: completed ? const Icon(Icons.check, size: 18) : Text('$index'),
        ),
        title: Text(lesson.title),
        subtitle: Text(
          [
            '~${lesson.estimatedMinutes} min',
            if (started) 'in progress',
          ].join(' · '),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push(AppRoutes.lesson(lesson.id)),
      ),
    );
  }
}
