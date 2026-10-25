// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroSection _$IntroSectionFromJson(Map<String, dynamic> json) => IntroSection(
  heading: json['heading'] as String,
  body: json['body'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$IntroSectionToJson(IntroSection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'body': instance.body,
      'type': instance.$type,
    };

VocabularySection _$VocabularySectionFromJson(Map<String, dynamic> json) =>
    VocabularySection(
      heading: json['heading'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => VocabularyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$VocabularySectionToJson(VocabularySection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'items': instance.items,
      'type': instance.$type,
    };

ExamplesSection _$ExamplesSectionFromJson(Map<String, dynamic> json) =>
    ExamplesSection(
      heading: json['heading'] as String,
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ExamplesSectionToJson(ExamplesSection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'sentences': instance.sentences,
      'type': instance.$type,
    };

BreakdownSection _$BreakdownSectionFromJson(Map<String, dynamic> json) =>
    BreakdownSection(
      heading: json['heading'] as String,
      sentence: Sentence.fromJson(json['sentence'] as Map<String, dynamic>),
      glosses: (json['glosses'] as List<dynamic>)
          .map((e) => WordGloss.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$BreakdownSectionToJson(BreakdownSection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'sentence': instance.sentence,
      'glosses': instance.glosses,
      'note': instance.note,
      'type': instance.$type,
    };

GrammarSection _$GrammarSectionFromJson(Map<String, dynamic> json) =>
    GrammarSection(
      heading: json['heading'] as String,
      body: json['body'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$GrammarSectionToJson(GrammarSection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'body': instance.body,
      'type': instance.$type,
    };

WhyThisWaySection _$WhyThisWaySectionFromJson(Map<String, dynamic> json) =>
    WhyThisWaySection(
      heading: json['heading'] as String,
      body: json['body'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$WhyThisWaySectionToJson(WhyThisWaySection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'body': instance.body,
      'type': instance.$type,
    };

ConversationSection _$ConversationSectionFromJson(Map<String, dynamic> json) =>
    ConversationSection(
      heading: json['heading'] as String,
      conversation: Conversation.fromJson(
        json['conversation'] as Map<String, dynamic>,
      ),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ConversationSectionToJson(
  ConversationSection instance,
) => <String, dynamic>{
  'heading': instance.heading,
  'conversation': instance.conversation,
  'type': instance.$type,
};

ExerciseSetSection _$ExerciseSetSectionFromJson(Map<String, dynamic> json) =>
    ExerciseSetSection(
      heading: json['heading'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ExerciseSetSectionToJson(ExerciseSetSection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'exercises': instance.exercises,
      'type': instance.$type,
    };

SummarySection _$SummarySectionFromJson(Map<String, dynamic> json) =>
    SummarySection(
      heading: json['heading'] as String,
      body: json['body'] as String,
      keyPoints:
          (json['keyPoints'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SummarySectionToJson(SummarySection instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'body': instance.body,
      'keyPoints': instance.keyPoints,
      'type': instance.$type,
    };

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: json['id'] as String,
  moduleId: json['moduleId'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt() ?? 15,
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => LessonSection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  verificationStatus:
      $enumDecodeNullable(
        _$VerificationStatusEnumMap,
        json['verificationStatus'],
      ) ??
      VerificationStatus.unverified,
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'moduleId': instance.moduleId,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'estimatedMinutes': instance.estimatedMinutes,
  'sections': instance.sections,
  'verificationStatus':
      _$VerificationStatusEnumMap[instance.verificationStatus]!,
};

const _$VerificationStatusEnumMap = {
  VerificationStatus.unverified: 'unverified',
  VerificationStatus.inReview: 'inReview',
  VerificationStatus.verified: 'verified',
};
