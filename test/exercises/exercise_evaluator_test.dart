import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/content/models/exercise.dart';
import 'package:sikho_punjabi/content/models/punjabi_line.dart';
import 'package:sikho_punjabi/features/exercises/domain/exercise_evaluator.dart';

void main() {
  const evaluator = ExerciseEvaluator();

  group('ExerciseEvaluator', () {
    test('multipleChoice: correct and incorrect options', () {
      const exercise = Exercise.multipleChoice(
        id: 'e1',
        prompt: PunjabiLine(gurmukhi: 'ਤੁਸੀਂ ਕਿਵੇਂ ਹੋ?'),
        question: 'Meaning?',
        options: [
          ExerciseOption(
            id: 'a',
            line: PunjabiLine(gurmukhi: 'How are you?'),
          ),
          ExerciseOption(
            id: 'b',
            line: PunjabiLine(gurmukhi: 'Goodbye'),
          ),
        ],
        correctOptionId: 'a',
      );

      expect(evaluator.evaluate(exercise, const OptionAnswer('a')), isTrue);
      expect(evaluator.evaluate(exercise, const OptionAnswer('b')), isFalse);
    });

    test('arrangeWords: order matters', () {
      const exercise = Exercise.arrangeWords(
        id: 'e2',
        prompt: PunjabiLine(gurmukhi: 'x'),
        tokens: ['ਤੁਸੀਂ', 'ਕਿਵੇਂ', 'ਹੋ'],
      );

      expect(
        evaluator.evaluate(
          exercise,
          const TokenSequenceAnswer(['ਤੁਸੀਂ', 'ਕਿਵੇਂ', 'ਹੋ']),
        ),
        isTrue,
      );
      expect(
        evaluator.evaluate(
          exercise,
          const TokenSequenceAnswer(['ਕਿਵੇਂ', 'ਤੁਸੀਂ', 'ਹੋ']),
        ),
        isFalse,
      );
      expect(
        evaluator.evaluate(exercise, const TokenSequenceAnswer(['ਤੁਸੀਂ'])),
        isFalse,
      );
    });

    test('typeTranslation: normalises case, whitespace, accepts variants', () {
      const exercise = Exercise.typeTranslation(
        id: 'e3',
        prompt: PunjabiLine(gurmukhi: 'ਮੈਂ ਠੀਕ ਹਾਂ'),
        acceptedAnswers: ['I am fine', "I'm fine"],
      );

      expect(
        evaluator.evaluate(exercise, const TextAnswer('  I AM   fine ')),
        isTrue,
      );
      expect(
        evaluator.evaluate(exercise, const TextAnswer("i'm fine")),
        isTrue,
      );
      expect(
        evaluator.evaluate(exercise, const TextAnswer('goodbye')),
        isFalse,
      );
    });

    test('mismatched answer type is false', () {
      const exercise = Exercise.multipleChoice(
        id: 'e4',
        prompt: PunjabiLine(gurmukhi: 'x'),
        question: 'q',
        options: [
          ExerciseOption(
            id: 'a',
            line: PunjabiLine(gurmukhi: 'y'),
          ),
        ],
        correctOptionId: 'a',
      );

      expect(evaluator.evaluate(exercise, const TextAnswer('a')), isFalse);
    });
  });
}
