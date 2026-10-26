import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/theme/app_tokens.dart';
import '../application/course_queries.dart';

/// Level detail — its modules with per-module progress.
class LevelScreen extends ConsumerWidget {
  const LevelScreen({required this.levelId, super.key});

  final String levelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final level = ref.watch(levelProvider(levelId));

    return Scaffold(
      appBar: AppBar(title: Text(level.value?.title ?? 'Level')),
      body: level.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load level: $e')),
        data: (level) => level == null
            ? const Center(child: Text('Level not found.'))
            : ListView(
                padding: AppSpacing.screenPadding,
                children: [
                  if (level.description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: Text(
                        level.description!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  for (final module in level.modules)
                    _ModuleCard(moduleId: module.id),
                ],
              ),
      ),
    );
  }
}

class _ModuleCard extends ConsumerWidget {
  const _ModuleCard({required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final module = ref.watch(moduleProvider(moduleId)).value;
    final completion = ref.watch(moduleCompletionProvider(moduleId));
    if (module == null) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListTile(
        contentPadding: AppSpacing.cardPadding,
        title: Text(module.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (module.description != null) Text(module.description!),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${completion.completed} of ${completion.total} lessons',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push(AppRoutes.module(module.id)),
      ),
    );
  }
}
