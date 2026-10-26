import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../content/content_repository.dart';
import '../../../core/theme/app_tokens.dart';
import '../application/course_queries.dart';

/// Course overview — all five levels with per-level progress.
class CourseScreen extends ConsumerWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Course')),
      body: course.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load course: $e')),
        data: (course) => ListView(
          padding: AppSpacing.screenPadding,
          children: [
            for (final level in course.levels) _LevelCard(levelId: level.id),
          ],
        ),
      ),
    );
  }
}

class _LevelCard extends ConsumerWidget {
  const _LevelCard({required this.levelId});

  final String levelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final level = ref.watch(levelProvider(levelId)).value;
    final completion = ref.watch(levelCompletionProvider(levelId));
    if (level == null) return const SizedBox.shrink();

    final empty = completion.total == 0;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: empty ? null : () => context.push(AppRoutes.level(level.id)),
        borderRadius: AppRadius.cardRadius,
        child: Padding(
          padding: AppSpacing.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      level.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (empty)
                    Text(
                      'Coming soon',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  else
                    const Icon(Icons.chevron_right),
                ],
              ),
              if (level.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Text(
                    level.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              if (!empty) ...[
                LinearProgressIndicator(
                  value: completion.fraction,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${completion.completed} of ${completion.total} lessons',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
