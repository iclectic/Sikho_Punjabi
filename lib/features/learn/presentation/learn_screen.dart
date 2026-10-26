import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../content/content_repository.dart';
import '../../../core/theme/app_tokens.dart';
import '../../courses/application/course_queries.dart';
import '../../progress/application/study_stats_provider.dart';
import '../../review/application/review_providers.dart';
import '../../vocabulary/application/vocabulary_providers.dart';

/// Home dashboard: greeting, key stats, continue-learning, review, and a link
/// into the full course browser.
class LearnScreen extends ConsumerWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseProvider);

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
            const _ContinueLearningCard(),
            const SizedBox(height: AppSpacing.lg),
            const _ReviewCard(),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: ListTile(
                leading: const Icon(Icons.route_outlined),
                title: Text(course.title),
                subtitle: const Text('Browse the full course'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AppRoutes.course),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            const _VocabularyCard(),
          ],
        ),
      ),
    );
  }
}

/// Compact stat chips: current streak and cards due.
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

class _ContinueLearningCard extends ConsumerWidget {
  const _ContinueLearningCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final next = ref.watch(nextLessonProvider);
    final completion = ref.watch(courseCompletionProvider);
    final isResume =
        next != null && ref.watch(lessonStartedProvider(next.lesson.id));

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
            if (next != null) ...[
              Text(
                next.moduleTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                next.lesson.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ] else
              Text(
                'Course complete — well done!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: completion.fraction,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text('${(completion.fraction * 100).round()}%'),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton.icon(
              onPressed: next == null
                  ? null
                  : () => context.push(AppRoutes.lesson(next.lesson.id)),
              icon: const Icon(Icons.play_arrow),
              label: Text(isResume ? 'Resume lesson' : 'Start lesson'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewCard extends ConsumerWidget {
  const _ReviewCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueCount = ref.watch(dueFlashcardCountProvider);

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

class _VocabularyCard extends ConsumerWidget {
  const _VocabularyCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(flashcardCountProvider);

    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book_outlined),
        title: const Text('Vocabulary'),
        subtitle: Text(
          count == 0 ? 'Words you learn will appear here' : '$count words',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push(AppRoutes.vocabulary),
      ),
    );
  }
}
