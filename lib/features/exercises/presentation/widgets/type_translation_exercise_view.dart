import 'package:flutter/material.dart';

import '../../../../content/models/punjabi_line.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/punjabi_text.dart';

/// Free-text translation exercise.
class TypeTranslationExerciseView extends StatefulWidget {
  const TypeTranslationExerciseView({
    required this.prompt,
    required this.onSubmit,
    super.key,
  });

  final PunjabiLine prompt;
  final ValueChanged<String> onSubmit;

  @override
  State<TypeTranslationExerciseView> createState() =>
      _TypeTranslationExerciseViewState();
}

class _TypeTranslationExerciseViewState
    extends State<TypeTranslationExerciseView> {
  final _controller = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Translate into English',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        PunjabiText(widget.prompt),
        const SizedBox(height: AppSpacing.md),
        TextField(
          controller: _controller,
          enabled: !_submitted,
          decoration: const InputDecoration(
            hintText: 'Type the English meaning',
          ),
          onSubmitted: (_) => _submit(),
        ),
        const SizedBox(height: AppSpacing.md),
        FilledButton(
          onPressed: _submitted || _controller.text.trim().isEmpty
              ? null
              : _submit,
          child: const Text('Check'),
        ),
      ],
    );
  }

  void _submit() {
    setState(() => _submitted = true);
    widget.onSubmit(_controller.text);
  }
}
