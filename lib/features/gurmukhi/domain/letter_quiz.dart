import 'dart:math';

import '../../../content/models/gurmukhi_letter.dart';

/// One question in the letter-recognition practice quiz.
class LetterQuestion {
  const LetterQuestion({
    required this.prompt,
    required this.promptIsLetter,
    required this.options,
    required this.correctIndex,
  });

  /// The glyph (letter→name question) or romanised sound (name→letter).
  final String prompt;

  /// True when the prompt is a Gurmukhi glyph and options are romanised
  /// sounds; false for the reverse direction.
  final bool promptIsLetter;
  final List<String> options;
  final int correctIndex;
}

/// Builds quiz questions from the letter table. Pure + seedable for tests.
///
/// Needs at least 4 letters to build a 4-option question; shorter lists
/// produce fewer questions.
List<LetterQuestion> generateLetterQuestions(
  List<GurmukhiLetter> letters, {
  int count = 10,
  Random? random,
}) {
  final rng = random ?? Random();
  final pool = [...letters]..shuffle(rng);
  final questions = <LetterQuestion>[];

  for (var i = 0; i < count && i < pool.length; i++) {
    final letter = pool[i];
    final letterToName = rng.nextBool();

    final distractors = pool
        .where((l) => l.id != letter.id)
        .take(3)
        .toList(growable: false);
    if (distractors.length < 3) break;

    final options = letterToName
        ? [letter.soundRomanised, ...distractors.map((d) => d.soundRomanised)]
        : [letter.letter, ...distractors.map((d) => d.letter)];
    options.shuffle(rng);

    questions.add(
      LetterQuestion(
        prompt: letterToName ? letter.letter : letter.soundRomanised,
        promptIsLetter: letterToName,
        options: options,
        correctIndex: options.indexOf(
          letterToName ? letter.soundRomanised : letter.letter,
        ),
      ),
    );
  }
  return questions;
}
