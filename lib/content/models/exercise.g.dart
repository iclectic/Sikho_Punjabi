// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseOption _$ExerciseOptionFromJson(Map<String, dynamic> json) =>
    _ExerciseOption(
      id: json['id'] as String,
      line: PunjabiLine.fromJson(json['line'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExerciseOptionToJson(_ExerciseOption instance) =>
    <String, dynamic>{'id': instance.id, 'line': instance.line};

_MatchPair _$MatchPairFromJson(Map<String, dynamic> json) => _MatchPair(
  id: json['id'] as String,
  left: PunjabiLine.fromJson(json['left'] as Map<String, dynamic>),
  right: PunjabiLine.fromJson(json['right'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchPairToJson(_MatchPair instance) =>
    <String, dynamic>{
      'id': instance.id,
      'left': instance.left,
      'right': instance.right,
    };

MultipleChoiceExercise _$MultipleChoiceExerciseFromJson(
  Map<String, dynamic> json,
) => MultipleChoiceExercise(
  id: json['id'] as String,
  prompt: PunjabiLine.fromJson(json['prompt'] as Map<String, dynamic>),
  question: json['question'] as String,
  options: (json['options'] as List<dynamic>)
      .map((e) => ExerciseOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  correctOptionId: json['correctOptionId'] as String,
  explanation: json['explanation'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$MultipleChoiceExerciseToJson(
  MultipleChoiceExercise instance,
) => <String, dynamic>{
  'id': instance.id,
  'prompt': instance.prompt,
  'question': instance.question,
  'options': instance.options,
  'correctOptionId': instance.correctOptionId,
  'explanation': instance.explanation,
  'type': instance.$type,
};

ArrangeWordsExercise _$ArrangeWordsExerciseFromJson(
  Map<String, dynamic> json,
) => ArrangeWordsExercise(
  id: json['id'] as String,
  prompt: PunjabiLine.fromJson(json['prompt'] as Map<String, dynamic>),
  tokens: (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
  distractors:
      (json['distractors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  explanation: json['explanation'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ArrangeWordsExerciseToJson(
  ArrangeWordsExercise instance,
) => <String, dynamic>{
  'id': instance.id,
  'prompt': instance.prompt,
  'tokens': instance.tokens,
  'distractors': instance.distractors,
  'explanation': instance.explanation,
  'type': instance.$type,
};

FillBlankExercise _$FillBlankExerciseFromJson(Map<String, dynamic> json) =>
    FillBlankExercise(
      id: json['id'] as String,
      prompt: PunjabiLine.fromJson(json['prompt'] as Map<String, dynamic>),
      template: json['template'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => ExerciseOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctOptionId: json['correctOptionId'] as String,
      explanation: json['explanation'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$FillBlankExerciseToJson(FillBlankExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'template': instance.template,
      'options': instance.options,
      'correctOptionId': instance.correctOptionId,
      'explanation': instance.explanation,
      'type': instance.$type,
    };

MatchPairsExercise _$MatchPairsExerciseFromJson(Map<String, dynamic> json) =>
    MatchPairsExercise(
      id: json['id'] as String,
      instructions: json['instructions'] as String,
      pairs: (json['pairs'] as List<dynamic>)
          .map((e) => MatchPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      explanation: json['explanation'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MatchPairsExerciseToJson(MatchPairsExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructions': instance.instructions,
      'pairs': instance.pairs,
      'explanation': instance.explanation,
      'type': instance.$type,
    };

TypeTranslationExercise _$TypeTranslationExerciseFromJson(
  Map<String, dynamic> json,
) => TypeTranslationExercise(
  id: json['id'] as String,
  prompt: PunjabiLine.fromJson(json['prompt'] as Map<String, dynamic>),
  acceptedAnswers: (json['acceptedAnswers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  explanation: json['explanation'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$TypeTranslationExerciseToJson(
  TypeTranslationExercise instance,
) => <String, dynamic>{
  'id': instance.id,
  'prompt': instance.prompt,
  'acceptedAnswers': instance.acceptedAnswers,
  'explanation': instance.explanation,
  'type': instance.$type,
};
