import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/models/exercise.dart';
import '../../../core/theme/app_tokens.dart';
import '../domain/exercise_evaluator.dart';
import 'widgets/arrange_words_exercise_view.dart';
import 'widgets/option_exercise_view.dart';
import 'widgets/type_translation_exercise_view.dart';

/// Runs a set of exercises in sequence with immediate feedback. Kept inside
/// the lesson page so exercise results never leave the lesson context (Phase 4
/// will add scoring/analytics around this).
class ExerciseRunner extends ConsumerStatefulWidget {
  const ExerciseRunner({required this.exercises, super.key});

  final List<Exercise> exercises;

  @override
  ConsumerState<ExerciseRunner> createState() => _ExerciseRunnerState();
}

class _ExerciseRunnerState extends ConsumerState<ExerciseRunner> {
  static const _evaluator = ExerciseEvaluator();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.exercises.isEmpty) {
      return const Text('No exercises in this lesson yet.');
    }
    final exercise = widget.exercises[_index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exercise ${_index + 1} of ${widget.exercises.length}',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        _ExerciseCard(
          key: ValueKey(exercise),
          exercise: exercise,
          evaluator: _evaluator,
          onAnswered: (_) {},
        ),
        if (_index < widget.exercises.length - 1)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => setState(() => _index++),
              child: const Text('Next exercise'),
            ),
          )
        else
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'All exercises complete — continue below.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

class _ExerciseCard extends StatefulWidget {
  const _ExerciseCard({
    required this.exercise,
    required this.evaluator,
    required this.onAnswered,
    super.key,
  });

  final Exercise exercise;
  final ExerciseEvaluator evaluator;
  final ValueChanged<bool> onAnswered;

  @override
  State<_ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<_ExerciseCard> {
  bool? _correct;

  void _submit(ExerciseAnswer answer) {
    final correct = widget.evaluator.evaluate(widget.exercise, answer);
    setState(() => _correct = correct);
    widget.onAnswered(correct);
  }

  @override
  Widget build(BuildContext context) {
    final explanation = switch (widget.exercise) {
      MultipleChoiceExercise e => e.explanation,
      ArrangeWordsExercise e => e.explanation,
      FillBlankExercise e => e.explanation,
      MatchPairsExercise e => e.explanation,
      TypeTranslationExercise e => e.explanation,
    };

    return Card(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            switch (widget.exercise) {
              MultipleChoiceExercise e => OptionExerciseView(
                key: const ValueKey('mc'),
                prompt: e.prompt,
                question: e.question,
                options: e.options,
                onSubmit: (id) => _submit(OptionAnswer(id)),
              ),
              FillBlankExercise e => OptionExerciseView(
                key: const ValueKey('fb'),
                prompt: e.prompt,
                question: e.template.replaceAll('___', '＿＿＿'),
                options: e.options,
                onSubmit: (id) => _submit(OptionAnswer(id)),
              ),
              ArrangeWordsExercise e => ArrangeWordsExerciseView(
                tokens: [...e.tokens, ...e.distractors]..shuffle(),
                onSubmit: (tokens) => _submit(TokenSequenceAnswer(tokens)),
              ),
              TypeTranslationExercise e => TypeTranslationExerciseView(
                prompt: e.prompt,
                onSubmit: (text) => _submit(TextAnswer(text)),
              ),
              MatchPairsExercise _ => const Text(
                'Match-pairs exercises arrive in the next phase.',
              ),
            },
            if (_correct != null) ...[
              const SizedBox(height: AppSpacing.md),
              _FeedbackBanner(correct: _correct!, explanation: explanation),
            ],
          ],
        ),
      ),
    );
  }
}

class _FeedbackBanner extends StatelessWidget {
  const _FeedbackBanner({required this.correct, this.explanation});

  final bool correct;
  final String? explanation;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = correct ? scheme.primaryContainer : scheme.errorContainer;
    final icon = correct ? Icons.check_circle : Icons.cancel;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(correct ? 'Correct' : 'Not quite'),
                if (explanation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Text(
                      explanation!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
