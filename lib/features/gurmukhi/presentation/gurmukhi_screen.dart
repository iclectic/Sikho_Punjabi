import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../content/models/gurmukhi_letter.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/punjabi_text.dart';

/// Grid of Gurmukhi letters. Progressive reading lessons build on this table.
class GurmukhiScreen extends ConsumerWidget {
  const GurmukhiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final letters = ref.watch(gurmukhiLettersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Gurmukhi')),
      body: letters.when(
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
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
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
          ],
        ),
      ),
    );
  }
}
