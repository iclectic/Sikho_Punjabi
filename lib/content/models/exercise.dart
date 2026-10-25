import 'package:freezed_annotation/freezed_annotation.dart';

import 'punjabi_line.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
abstract class ExerciseOption with _$ExerciseOption {
  const factory ExerciseOption({
    required String id,
    required PunjabiLine line,
  }) = _ExerciseOption;

  factory ExerciseOption.fromJson(Map<String, dynamic> json) =>
      _$ExerciseOptionFromJson(json);
}

@freezed
abstract class MatchPair with _$MatchPair {
  const factory MatchPair({
    required String id,
    required PunjabiLine left,
    required PunjabiLine right,
  }) = _MatchPair;

  factory MatchPair.fromJson(Map<String, dynamic> json) =>
      _$MatchPairFromJson(json);
}

/// Extensible exercise model. New exercise types are added as new factory
/// constructors; the exercise engine dispatches on the sealed type.
@Freezed(unionKey: 'type')
sealed class Exercise with _$Exercise {
  /// Pick the correct option for [prompt].
  const factory Exercise.multipleChoice({
    required String id,
    required PunjabiLine prompt,
    required String question,
    required List<ExerciseOption> options,
    required String correctOptionId,
    String? explanation,
  }) = MultipleChoiceExercise;

  /// Re-order [tokens] (plus [distractors]) into a correct Punjabi sentence.
  const factory Exercise.arrangeWords({
    required String id,
    required PunjabiLine prompt,
    required List<String> tokens,
    @Default([]) List<String> distractors,
    String? explanation,
  }) = ArrangeWordsExercise;

  /// Fill the blank in [template], which contains `___` as the blank marker.
  const factory Exercise.fillBlank({
    required String id,
    required PunjabiLine prompt,
    required String template,
    required List<ExerciseOption> options,
    required String correctOptionId,
    String? explanation,
  }) = FillBlankExercise;

  /// Match each [pairs].left to its [pairs].right.
  const factory Exercise.matchPairs({
    required String id,
    required String instructions,
    required List<MatchPair> pairs,
    String? explanation,
  }) = MatchPairsExercise;

  /// Type the English translation of [prompt].
  const factory Exercise.typeTranslation({
    required String id,
    required PunjabiLine prompt,
    required List<String> acceptedAnswers,
    String? explanation,
  }) = TypeTranslationExercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
