import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../core/theme/app_tokens.dart';
import '../domain/letter_quiz.dart';

/// Letter-recognition drill: 10 questions alternating letter→sound and
/// sound→letter. Session-only — no progress is stored (honest scope: this is
/// a warm-up tool, not the spaced-repetition system).
class LetterPracticeScreen extends ConsumerStatefulWidget {
  const LetterPracticeScreen({super.key});

  @override
  ConsumerState<LetterPracticeScreen> createState() =>
      _LetterPracticeScreenState();
}

class _LetterPracticeScreenState extends ConsumerState<LetterPracticeScreen> {
  List<LetterQuestion>? _questions;
  int _index = 0;
  int _score = 0;
  int? _picked;

  @override
  Widget build(BuildContext context) {
    final questions = _questions;
    return Scaffold(
      appBar: AppBar(title: const Text('Letter practice')),
      body: questions == null
          ? ref
                .watch(gurmukhiLettersProvider)
                .when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('$e')),
                  data: (letters) => Center(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Start 10-question drill'),
                      onPressed: () => setState(
                        () => _questions = generateLetterQuestions(letters),
                      ),
                    ),
                  ),
                )
          : _index >= questions.length
          ? _Results(score: _score, total: questions.length)
          : _questionView(questions[_index]),
    );
  }

  Widget _questionView(LetterQuestion q) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${_index + 1} of ${_questions!.length}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            q.promptIsLetter
                ? 'What sound does this letter make?'
                : 'Which letter makes this sound?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: Text(
              q.prompt,
              style: q.promptIsLetter
                  ? Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontFamily: 'NotoSansGurmukhi',
                    )
                  : Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          for (var i = 0; i < q.options.length; i++) ...[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: _picked == null
                    ? null
                    : i == q.correctIndex
                    ? scheme.primaryContainer
                    : i == _picked
                    ? scheme.errorContainer
                    : null,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              ),
              onPressed: _picked != null
                  ? null
                  : () => setState(() {
                      _picked = i;
                      if (i == q.correctIndex) _score++;
                    }),
              child: Text(
                q.options[i],
                style: q.promptIsLetter
                    ? null
                    : const TextStyle(
                        fontFamily: 'NotoSansGurmukhi',
                        fontSize: 22,
                      ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          const Spacer(),
          if (_picked != null)
            FilledButton(
              onPressed: () => setState(() {
                _index++;
                _picked = null;
              }),
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.score, required this.total});

  final int score;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events_outlined, size: 56),
            const SizedBox(height: AppSpacing.md),
            Text(
              '$score of $total correct',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              score == total
                  ? 'Perfect — the letters are sticking.'
                  : 'Review the letters below and try again.',
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
