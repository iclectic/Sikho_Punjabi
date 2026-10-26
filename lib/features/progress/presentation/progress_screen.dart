import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../core/theme/app_tokens.dart';
import '../../review/application/review_providers.dart';
import '../../vocabulary/application/vocabulary_providers.dart';
import '../application/lesson_progress_provider.dart';
import '../application/study_stats_provider.dart';

/// Honest progress stats — no streak-shaming, just useful numbers.
class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseProvider).value;
    final progress = ref.watch(lessonProgressListProvider).value ?? [];
    final stats = ref.watch(studyStatsProvider);
    final vocabCount = ref.watch(allFlashcardsProvider).value?.length ?? 0;
    final reviewStats = ref.watch(reviewStatsProvider);
    final forecast = ref.watch(dueForecastProvider);

    final total = course == null
        ? 0
        : course.levels
              .expand((l) => l.modules)
              .expand((m) => m.lessons)
              .length;
    final completed = progress.where((p) => p.completed).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          _StatTile(
            icon: Icons.school,
            label: 'Lessons completed',
            value: '$completed of $total',
            progress: total == 0 ? null : completed / total,
          ),
          _StatTile(
            icon: Icons.local_fire_department_outlined,
            label: 'Current streak',
            value: '${stats.streak} day${stats.streak == 1 ? '' : 's'}',
          ),
          _StatTile(
            icon: Icons.style,
            label: 'Words in review',
            value: '$vocabCount',
          ),
          _StatTile(
            icon: Icons.fact_check_outlined,
            label: 'Reviews completed',
            value: '${reviewStats.total}',
          ),
          _StatTile(
            icon: Icons.psychology_outlined,
            label: 'Recall rate',
            value: reviewStats.total == 0
                ? '—'
                : '${(reviewStats.successRate * 100).round()}%',
          ),
          _StatTile(
            icon: Icons.event_repeat,
            label: 'Due this week',
            value: '${forecast.fold<int>(0, (sum, n) => sum + n)} cards',
          ),
          _StatTile(
            icon: Icons.calendar_month,
            label: 'Days studied',
            value: '${stats.daysStudied}',
          ),
          _StatTile(
            icon: Icons.schedule,
            label: 'Total study time',
            value: _formatDuration(stats.totalSeconds),
          ),
        ],
      ),
    );
  }

  static String _formatDuration(int seconds) {
    if (seconds < 60) return '$seconds sec';
    final minutes = seconds ~/ 60;
    if (minutes < 60) return '$minutes min';
    return '${minutes ~/ 60} h ${minutes % 60} min';
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    this.progress,
  });

  final IconData icon;
  final String label;
  final String value;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyMedium),
                  Text(value, style: Theme.of(context).textTheme.titleLarge),
                  if (progress != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    LinearProgressIndicator(value: progress),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
