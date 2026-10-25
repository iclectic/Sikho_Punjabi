// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sentence _$SentenceFromJson(Map<String, dynamic> json) => _Sentence(
  line: PunjabiLine.fromJson(json['line'] as Map<String, dynamic>),
  glosses:
      (json['glosses'] as List<dynamic>?)
          ?.map((e) => WordGloss.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  note: json['note'] as String?,
);

Map<String, dynamic> _$SentenceToJson(_Sentence instance) => <String, dynamic>{
  'line': instance.line,
  'glosses': instance.glosses,
  'note': instance.note,
};
