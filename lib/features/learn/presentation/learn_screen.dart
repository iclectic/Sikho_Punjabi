import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../content/content_repository.dart';
import '../../../content/models/course.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../../progress/application/study_stats_provider.dart';
import '../../review/application/review_providers.dart';

final lessonProgressListProvider =
    StreamProvider<List<LessonProgressTableData>>(
      (ref) => ref.watch(appDatabaseProvider).watchAllLessonProgress(),
    );

class LearnScreen extends ConsumerWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseProvider);
    final progress = ref.watch(lessonProgressListProvider);
    final dueCount = ref.watch(dueFlashcardCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sikho Punjabi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: course.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load course: $e')),
        data: (course) => ListView(
          padding: AppSpacing.screenPadding,
          children: [
            Text(
              'ਸਤ ਸ੍ਰੀ ਅਕਾਲ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Sat sri akal — ready to learn?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            const _StatsRow(),
            const SizedBox(height: AppSpacing.lg),
            _ContinueLearningCard(
              course: course,
              progress: progress.value ?? const [],
            ),
            const SizedBox(height: AppSpacing.lg),
            _ReviewCard(dueCount: dueCount),
            const SizedBox(height: AppSpacing.xl),
            for (final level in course.levels) ...[
              Text(level.title, style: Theme.of(context).textTheme.titleLarge),
              if (level.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Text(
                    level.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              for (final module in level.modules)
                _ModuleCard(
                  module: module,
                  progress: progress.value ?? const [],
                ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ],
        ),
      ),
    );
  }
}

/// Compact stat chips: current streak, words in review, cards due.
/// Deliberately honest numbers — no badges, no pressure mechanics.
class _StatsRow extends ConsumerWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(studyStatsProvider);
    final dueCount = ref.watch(dueFlashcardCountProvider);

    return Row(
      children: [
        _StatChip(
          icon: Icons.local_fire_department_outlined,
          label: '${stats.streak} day${stats.streak == 1 ? '' : 's'}',
        ),
        const SizedBox(width: AppSpacing.sm),
        _StatChip(icon: Icons.style_outlined, label: '$dueCount due'),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _ContinueLearningCard extends StatelessWidget {
  const _ContinueLearningCard({required this.course, required this.progress});

  final Course course;
  final List<LessonProgressTableData> progress;

  @override
  Widget build(BuildContext context) {
    final completedIds = {
      for (final p in progress)
        if (p.completed) p.lessonId,
    };
    final started = progress
        .where((p) => !p.completed)
        .fold<LessonProgressTableData?>(
          null,
          (latest, p) => latest == null || p.updatedAt.isAfter(latest.updatedAt)
              ? p
              : latest,
        );

    LessonRef? next;
    String? moduleTitle;
    if (started != null) {
      for (final level in course.levels) {
        for (final m in level.modules) {
          for (final l in m.lessons) {
            if (l.id == started.lessonId) {
              next = l;
              moduleTitle = m.title;
            }
          }
        }
      }
    }
    next ??= _firstLesson(course);
    moduleTitle ??= _firstModuleTitle(course);

    final total = course.levels
        .expand((l) => l.modules)
        .expand((m) => m.lessons)
        .length;
    final done = completedIds.length;
    final fraction = total == 0 ? 0.0 : done / total;

    return Card(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Continue learning',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            if (moduleTitle != null)
              Text(moduleTitle, style: Theme.of(context).textTheme.bodySmall),
            if (next != null)
              Text(next.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: fraction,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text('${(fraction * 100).round()}%'),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton.icon(
              onPressed: next == null
                  ? null
                  : () => context.push(AppRoutes.lesson(next!.id)),
              icon: const Icon(Icons.play_arrow),
              label: Text(started == null ? 'Start course' : 'Resume lesson'),
            ),
          ],
        ),
      ),
    );
  }

  static LessonRef? _firstLesson(Course course) {
    for (final level in course.levels) {
      for (final m in level.modules) {
        if (m.lessons.isNotEmpty) return m.lessons.first;
      }
    }
    return null;
  }

  static String? _firstModuleTitle(Course course) {
    for (final level in course.levels) {
      for (final m in level.modules) {
        if (m.lessons.isNotEmpty) return m.title;
      }
    }
    return null;
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.dueCount});

  final int dueCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.style),
        title: const Text('Flashcard review'),
        subtitle: Text(
          dueCount == 0 ? 'Nothing due right now' : '$dueCount cards due',
        ),
        trailing: dueCount == 0 ? null : const Icon(Icons.chevron_right),
        onTap: () => context.go(AppRoutes.review),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({required this.module, required this.progress});

  final Module module;
  final List<LessonProgressTableData> progress;

  @override
  Widget build(BuildContext context) {
    final progressById = {for (final p in progress) p.lessonId: p};

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(module.title, style: Theme.of(context).textTheme.titleMedium),
            if (module.description != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  module.description!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: AppSpacing.sm),
            for (final lesson in module.lessons)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  progressById[lesson.id]?.completed == true
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: progressById[lesson.id]?.completed == true
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                title: Text(lesson.title),
                subtitle: Text('~${lesson.estimatedMinutes} min'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AppRoutes.lesson(lesson.id)),
              ),
          ],
        ),
      ),
    );
  }
}
