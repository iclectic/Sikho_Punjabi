// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gurmukhi_letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GurmukhiLetter _$GurmukhiLetterFromJson(Map<String, dynamic> json) =>
    _GurmukhiLetter(
      id: json['id'] as String,
      letter: json['letter'] as String,
      name: json['name'] as String,
      soundRomanised: json['soundRomanised'] as String,
      audioRef: json['audioRef'] as String?,
      exampleWord: json['exampleWord'] == null
          ? null
          : PunjabiLine.fromJson(json['exampleWord'] as Map<String, dynamic>),
      verificationStatus:
          $enumDecodeNullable(
            _$VerificationStatusEnumMap,
            json['verificationStatus'],
          ) ??
          VerificationStatus.unverified,
    );

Map<String, dynamic> _$GurmukhiLetterToJson(_GurmukhiLetter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'name': instance.name,
      'soundRomanised': instance.soundRomanised,
      'audioRef': instance.audioRef,
      'exampleWord': instance.exampleWord,
      'verificationStatus':
          _$VerificationStatusEnumMap[instance.verificationStatus]!,
    };

const _$VerificationStatusEnumMap = {
  VerificationStatus.unverified: 'unverified',
  VerificationStatus.inReview: 'inReview',
  VerificationStatus.verified: 'verified',
};
