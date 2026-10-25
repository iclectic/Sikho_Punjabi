import 'package:flutter/material.dart';

import '../../../../content/models/exercise.dart';
import '../../../../content/models/punjabi_line.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/punjabi_text.dart';

/// Shared single-answer option picker used by multiple-choice and
/// fill-in-the-blank exercises.
class OptionExerciseView extends StatefulWidget {
  const OptionExerciseView({
    required this.prompt,
    required this.question,
    required this.options,
    required this.onSubmit,
    super.key,
  });

  final PunjabiLine prompt;
  final String question;
  final List<ExerciseOption> options;
  final ValueChanged<String> onSubmit;

  @override
  State<OptionExerciseView> createState() => _OptionExerciseViewState();
}

class _OptionExerciseViewState extends State<OptionExerciseView> {
  String? _selected;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        PunjabiText(widget.prompt),
        const SizedBox(height: AppSpacing.md),
        for (final option in widget.options)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  backgroundColor: _selected == option.id
                      ? Theme.of(
                          context,
                        ).colorScheme.primaryContainer.withValues(alpha: 0.5)
                      : null,
                ),
                onPressed: _submitted
                    ? null
                    : () => setState(() => _selected = option.id),
                child: PunjabiText(
                  option.line,
                  gurmukhiStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        FilledButton(
          onPressed: _selected == null || _submitted
              ? null
              : () {
                  setState(() => _submitted = true);
                  widget.onSubmit(_selected!);
                },
          child: const Text('Check'),
        ),
      ],
    );
  }
}
