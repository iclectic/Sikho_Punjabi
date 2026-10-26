import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/audio_controls.dart';
import '../../courses/application/course_queries.dart';
import '../../settings/domain/settings.dart';
import '../application/vocabulary_providers.dart';

class VocabularyScreen extends ConsumerStatefulWidget {
  const VocabularyScreen({super.key});

  @override
  ConsumerState<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends ConsumerState<VocabularyScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final cardsAsync = ref.watch(allFlashcardsProvider);
    final titles = ref.watch(lessonTitleMapProvider);
    final scriptMode = ref.watch(settingsProvider).scriptDisplayMode;
    final query = _query.toLowerCase();

    return Scaffold(
      appBar: AppBar(title: const Text('Vocabulary')),
      body: cardsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Could not load: $error')),
        data: (cards) {
          final filtered = query.isEmpty
              ? cards
              : cards
                    .where(
                      (c) =>
                          c.gurmukhi.toLowerCase().contains(query) ||
                          (c.romanised?.toLowerCase().contains(query) ??
                              false) ||
                          (c.english?.toLowerCase().contains(query) ?? false),
                    )
                    .toList();

          if (filtered.isEmpty) {
            return Center(
              child: Text(
                cards.isEmpty
                    ? 'Complete a lesson to start building vocabulary.'
                    : 'No words match “$query”.',
              ),
            );
          }

          final byLesson = <String?, List<FlashcardsTableData>>{};
          for (final card in filtered) {
            byLesson.putIfAbsent(card.lessonId, () => []).add(card);
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.sm,
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search words…',
                  ),
                  onChanged: (value) => setState(() => _query = value),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (final entry in byLesson.entries) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.lg,
                          AppSpacing.lg,
                          AppSpacing.lg,
                          AppSpacing.xs,
                        ),
                        child: Text(
                          entry.key != null
                              ? (titles[entry.key] ?? 'Lesson')
                              : 'Other',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      for (final card in entry.value)
                        ListTile(
                          title: Text(
                            scriptMode == ScriptDisplayMode.romanisedEnglish
                                ? card.romanised ?? card.gurmukhi
                                : card.gurmukhi,
                            style: scriptMode == ScriptDisplayMode.punjabiOnly
                                ? const TextStyle(
                                    fontFamily: 'NotoSansGurmukhi',
                                  )
                                : null,
                          ),
                          subtitle: Text(switch (scriptMode) {
                            ScriptDisplayMode.gurmukhiRomanisedEnglish =>
                              '${card.romanised ?? ''} — ${card.english ?? ''}',
                            ScriptDisplayMode.gurmukhiEnglish =>
                              card.english ?? '',
                            ScriptDisplayMode.romanisedEnglish =>
                              card.english ?? '',
                            ScriptDisplayMode.punjabiOnly => '',
                          }),
                          trailing: _DueChip(dueAt: card.dueAt),
                          onTap: () => _showCardDetail(context, ref, card),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showCardDetail(
    BuildContext context,
    WidgetRef ref,
    FlashcardsTableData card,
  ) {
    final scheme = Theme.of(context).colorScheme;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                card.gurmukhi,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: 'NotoSansGurmukhi',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                [
                  card.romanised,
                  card.english,
                ].whereType<String>().join('  ·  '),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              _statRow(
                context,
                'Repetitions',
                '${card.repetitions}',
                'Interval',
                card.intervalDays == 0 ? '—' : '${card.intervalDays} days',
              ),
              const SizedBox(height: AppSpacing.xs),
              _statRow(
                context,
                'Next due',
                card.dueAt.isAfter(DateTime.now())
                    ? DateFormat.MMMd().format(card.dueAt)
                    : 'now',
                'Ease',
                card.easeFactor.toStringAsFixed(2),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AudioControls(card.audioRef),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Recording pending',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: scheme.outline),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton.icon(
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reset review progress'),
                onPressed: () async {
                  await ref.read(appDatabaseProvider).resetFlashcard(card.id);
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statRow(
    BuildContext context,
    String l1,
    String v1,
    String l2,
    String v2,
  ) {
    return Row(
      children: [
        Expanded(child: _stat(context, l1, v1)),
        Expanded(child: _stat(context, l2, v2)),
      ],
    );
  }

  Widget _stat(BuildContext context, String label, String value) => Column(
    children: [
      Text(value, style: Theme.of(context).textTheme.titleMedium),
      Text(label, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}

class _DueChip extends StatelessWidget {
  const _DueChip({required this.dueAt});

  final DateTime dueAt;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final due = !dueAt.isAfter(DateTime.now());
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: due ? scheme.tertiaryContainer : scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Text(
        due ? 'due' : DateFormat.MMMd().format(dueAt),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
