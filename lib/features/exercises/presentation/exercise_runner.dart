import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/models/exercise.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../application/exercise_providers.dart';
import '../domain/exercise_evaluator.dart';
import 'widgets/arrange_words_exercise_view.dart';
import 'widgets/match_pairs_exercise_view.dart';
import 'widgets/option_exercise_view.dart';
import 'widgets/type_translation_exercise_view.dart';

/// Runs a lesson's exercises in order with immediate feedback.
///
/// - Results persist to [ExerciseResultsTable] so a learner can leave and
///   resume where they left off.
/// - A wrong answer shows feedback plus a retry; the exercise only counts
///   when answered correctly.
/// - Exercises already answered correctly in a previous session are skipped.
class ExerciseRunner extends ConsumerStatefulWidget {
  const ExerciseRunner({
    required this.lessonId,
    required this.exercises,
    super.key,
  });

  final String lessonId;
  final List<Exercise> exercises;

  @override
  ConsumerState<ExerciseRunner> createState() => _ExerciseRunnerState();
}

class _ExerciseRunnerState extends ConsumerState<ExerciseRunner> {
  static const _evaluator = ExerciseEvaluator();
  int? _index;

  @override
  Widget build(BuildContext context) {
    if (widget.exercises.isEmpty) {
      return const Text('No exercises in this lesson yet.');
    }

    final results =
        ref.watch(exerciseResultsProvider(widget.lessonId)).value ?? const {};

    _index ??= widget.exercises.indexWhere((e) => results[e.id] != true);
    final index = _index! < 0 ? widget.exercises.length - 1 : _index!;
    final done = results.values.where((c) => c).length;
    final allDone = done >= widget.exercises.length;
    final exercise = widget.exercises[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exercise ${index + 1} of ${widget.exercises.length}'
          '${results[exercise.id] == true ? ' · done' : ''}',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        _ExerciseCard(
          key: ValueKey(exercise.id),
          exercise: exercise,
          evaluator: _evaluator,
          alreadyCorrect: results[exercise.id] == true,
          onResult: (correct) => ref
              .read(appDatabaseProvider)
              .saveExerciseResult(
                lessonId: widget.lessonId,
                exerciseId: exercise.id,
                correct: correct,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            if (index > 0)
              TextButton(
                onPressed: () => setState(() => _index = index - 1),
                child: const Text('Previous'),
              ),
            const Spacer(),
            if (index < widget.exercises.length - 1)
              TextButton(
                onPressed: () => setState(() => _index = index + 1),
                child: const Text('Next exercise'),
              ),
          ],
        ),
        if (allDone)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Text(
              'All exercises complete — finish the lesson below.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Text(
              '$done of ${widget.exercises.length} answered correctly',
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
    required this.alreadyCorrect,
    required this.onResult,
    super.key,
  });

  final Exercise exercise;
  final ExerciseEvaluator evaluator;
  final bool alreadyCorrect;
  final ValueChanged<bool> onResult;

  @override
  State<_ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<_ExerciseCard> {
  bool? _correct;

  /// Bumped on retry to rebuild the answer view with clean internal state.
  int _attempt = 0;

  @override
  void initState() {
    super.initState();
    if (widget.alreadyCorrect) _correct = true;
  }

  void _submit(ExerciseAnswer answer) {
    // Never overwrite a result for an exercise completed in a previous
    // session — re-attempts are practice, not a downgrade.
    if (widget.alreadyCorrect) return;
    final correct = widget.evaluator.evaluate(widget.exercise, answer);
    setState(() => _correct = correct);
    widget.onResult(correct);
  }

  void _retry() => setState(() {
    _correct = null;
    _attempt++;
  });

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
                key: ValueKey('mc-$_attempt'),
                prompt: e.prompt,
                question: e.question,
                options: e.options,
                onSubmit: (id) => _submit(OptionAnswer(id)),
              ),
              FillBlankExercise e => OptionExerciseView(
                key: ValueKey('fb-$_attempt'),
                prompt: e.prompt,
                question: e.template.replaceAll('___', '＿＿＿'),
                options: e.options,
                onSubmit: (id) => _submit(OptionAnswer(id)),
              ),
              ArrangeWordsExercise e => ArrangeWordsExerciseView(
                key: ValueKey('aw-$_attempt'),
                tokens: [...e.tokens, ...e.distractors]..shuffle(),
                onSubmit: (tokens) => _submit(TokenSequenceAnswer(tokens)),
              ),
              TypeTranslationExercise e => TypeTranslationExerciseView(
                key: ValueKey('tt-$_attempt'),
                prompt: e.prompt,
                onSubmit: (text) => _submit(TextAnswer(text)),
              ),
              MatchPairsExercise e => MatchPairsExerciseView(
                key: ValueKey('mp-$_attempt'),
                instructions: e.instructions,
                pairs: e.pairs,
                onSubmit: (map) => _submit(PairingAnswer(map)),
              ),
            },
            if (_correct != null) ...[
              const SizedBox(height: AppSpacing.md),
              _FeedbackBanner(correct: _correct!, explanation: explanation),
              if (_correct == false) ...[
                const SizedBox(height: AppSpacing.sm),
                OutlinedButton.icon(
                  onPressed: _retry,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Try again'),
                ),
              ],
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
