import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';

/// Tap-to-order word arrangement. Learner taps tokens to build the sentence,
/// taps placed tokens to remove them.
class ArrangeWordsExerciseView extends StatefulWidget {
  const ArrangeWordsExerciseView({
    required this.tokens,
    required this.onSubmit,
    super.key,
  });

  final List<String> tokens;
  final ValueChanged<List<String>> onSubmit;

  @override
  State<ArrangeWordsExerciseView> createState() =>
      _ArrangeWordsExerciseViewState();
}

class _ArrangeWordsExerciseViewState extends State<ArrangeWordsExerciseView> {
  late final List<String> _bank = [...widget.tokens];
  final List<String> _placed = [];
  bool _submitted = false;

  void _place(String token) {
    setState(() {
      _bank.remove(token);
      _placed.add(token);
    });
  }

  void _remove(String token) {
    setState(() {
      _placed.remove(token);
      _bank.add(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arrange the words into a correct sentence',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final token in _placed)
                InputChip(
                  label: Text(token),
                  onPressed: _submitted ? null : () => _remove(token),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final token in _bank)
              ActionChip(
                label: Text(token),
                onPressed: _submitted ? null : () => _place(token),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        FilledButton(
          onPressed: _placed.isEmpty || _submitted
              ? null
              : () {
                  setState(() => _submitted = true);
                  widget.onSubmit(List.unmodifiable(_placed));
                },
          child: const Text('Check'),
        ),
      ],
    );
  }
}
