import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../content/models/gurmukhi_letter.dart';
import '../../../content/models/gurmukhi_vowel_sign.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/audio_controls.dart';
import '../../../shared/widgets/punjabi_text.dart';
import 'letter_practice_screen.dart';

/// Gurmukhi reference: the 35 letters and the vowel signs, plus a
/// recognition drill. Progressive reading lessons build on these tables.
class GurmukhiScreen extends ConsumerStatefulWidget {
  const GurmukhiScreen({super.key});

  @override
  ConsumerState<GurmukhiScreen> createState() => _GurmukhiScreenState();
}

class _GurmukhiScreenState extends ConsumerState<GurmukhiScreen> {
  bool _showVowels = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gurmukhi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.quiz_outlined),
            tooltip: 'Practice letters',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LetterPracticeScreen(),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Letters')),
                ButtonSegment(value: true, label: Text('Vowel signs')),
              ],
              selected: {_showVowels},
              onSelectionChanged: (s) => setState(() => _showVowels = s.first),
            ),
          ),
          Expanded(
            child: _showVowels ? const _VowelSignGrid() : const _LetterGrid(),
          ),
        ],
      ),
    );
  }
}

class _LetterGrid extends ConsumerWidget {
  const _LetterGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final letters = ref.watch(gurmukhiLettersProvider);

    return letters.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Could not load letters: $e')),
      data: (letters) => GridView.builder(
        padding: AppSpacing.screenPadding,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
        ),
        itemCount: letters.length,
        itemBuilder: (context, i) {
          final letter = letters[i];
          return Card(
            child: InkWell(
              onTap: () => _showLetter(context, letter),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      letter.letter,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      letter.soundRomanised,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLetter(BuildContext context, GurmukhiLetter letter) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: AppSpacing.screenPadding.copyWith(bottom: AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  letter.letter,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        letter.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Sound: ${letter.soundRomanised}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (letter.exampleWord != null) ...[
              const SizedBox(height: AppSpacing.lg),
              Text('Example', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: AppSpacing.sm),
              PunjabiText(letter.exampleWord!),
            ],
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                AudioControls(letter.audioRef),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Recording pending',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VowelSignGrid extends ConsumerWidget {
  const _VowelSignGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signs = ref.watch(gurmukhiVowelSignsProvider);

    return signs.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Could not load vowel signs: $e')),
      data: (signs) => GridView.builder(
        padding: AppSpacing.screenPadding,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 140,
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
        ),
        itemCount: signs.length,
        itemBuilder: (context, i) {
          final sign = signs[i];
          return Card(
            child: InkWell(
              onTap: () => _showSign(context, sign),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      sign.exampleForm ?? sign.sign,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      sign.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSign(BuildContext context, GurmukhiVowelSign sign) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: AppSpacing.screenPadding.copyWith(bottom: AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  sign.exampleForm ?? sign.sign,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sign.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Sound: ${sign.soundRomanised}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (sign.exampleForm != null)
                        Text(
                          'Shown attached to ਸ (sa)',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
