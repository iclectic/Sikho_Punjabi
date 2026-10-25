// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_gloss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordGloss _$WordGlossFromJson(Map<String, dynamic> json) => _WordGloss(
  gurmukhi: json['gurmukhi'] as String,
  romanised: json['romanised'] as String?,
  meaning: json['meaning'] as String,
  grammarNote: json['grammarNote'] as String?,
);

Map<String, dynamic> _$WordGlossToJson(_WordGloss instance) =>
    <String, dynamic>{
      'gurmukhi': instance.gurmukhi,
      'romanised': instance.romanised,
      'meaning': instance.meaning,
      'grammarNote': instance.grammarNote,
    };
