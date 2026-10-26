import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/content/models/gurmukhi_letter.dart';
import 'package:sikho_punjabi/features/gurmukhi/domain/letter_quiz.dart';

void main() {
  GurmukhiLetter letter(String id, String glyph) =>
      GurmukhiLetter(id: id, letter: glyph, name: id, soundRomanised: 's_$id');

  final letters = [
    for (var i = 0; i < 8; i++) letter('l$i', String.fromCharCode(0x0A05 + i)),
  ];

  test('generates requested count with 4 unique options and valid answer', () {
    final questions = generateLetterQuestions(
      letters,
      count: 6,
      random: Random(42),
    );

    expect(questions, hasLength(6));
    for (final q in questions) {
      expect(q.options.toSet(), hasLength(4));
      expect(q.correctIndex, inInclusiveRange(0, 3));
      // The correct option must correspond to the prompt.
      if (q.promptIsLetter) {
        final source = letters.firstWhere((l) => l.letter == q.prompt);
        expect(q.options[q.correctIndex], source.soundRomanised);
      } else {
        final source = letters.firstWhere((l) => l.soundRomanised == q.prompt);
        expect(q.options[q.correctIndex], source.letter);
      }
    }
  });

  test('is deterministic for a given seed', () {
    final a = generateLetterQuestions(letters, random: Random(7));
    final b = generateLetterQuestions(letters, random: Random(7));
    expect(a.map((q) => q.prompt).toList(), b.map((q) => q.prompt).toList());
  });
}
