import '../../../content/models/exercise.dart';

/// The learner's answer to an exercise, normalised so the evaluator never
/// needs widget state.
sealed class ExerciseAnswer {
  const ExerciseAnswer();
}

class OptionAnswer extends ExerciseAnswer {
  const OptionAnswer(this.optionId);
  final String optionId;
}

class TokenSequenceAnswer extends ExerciseAnswer {
  const TokenSequenceAnswer(this.tokens);
  final List<String> tokens;
}

class PairingAnswer extends ExerciseAnswer {
  const PairingAnswer(this.leftToRight);
  final Map<String, String> leftToRight;
}

class TextAnswer extends ExerciseAnswer {
  const TextAnswer(this.text);
  final String text;
}

/// Centralised, pure answer evaluation for every exercise type.
class ExerciseEvaluator {
  const ExerciseEvaluator();

  bool evaluate(Exercise exercise, ExerciseAnswer answer) {
    return switch ((exercise, answer)) {
      (MultipleChoiceExercise e, OptionAnswer a) =>
        a.optionId == e.correctOptionId,
      (FillBlankExercise e, OptionAnswer a) => a.optionId == e.correctOptionId,
      (ListeningExercise e, OptionAnswer a) => a.optionId == e.correctOptionId,
      (ArrangeWordsExercise e, TokenSequenceAnswer a) => _tokensEqual(
        a.tokens,
        e.tokens,
      ),
      (MatchPairsExercise e, PairingAnswer a) => e.pairs.every(
        (p) => a.leftToRight[p.id] == p.id,
      ),
      (TypeTranslationExercise e, TextAnswer a) => e.acceptedAnswers.any(
        (accepted) => _normalise(accepted) == _normalise(a.text),
      ),
      _ => false,
    };
  }

  static bool _tokensEqual(List<String> a, List<String> b) =>
      a.length == b.length &&
      List.generate(a.length, (i) => a[i] == b[i]).every((ok) => ok);

  static String _normalise(String s) =>
      s.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}
