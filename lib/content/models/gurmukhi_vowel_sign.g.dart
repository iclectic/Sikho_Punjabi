// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gurmukhi_vowel_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GurmukhiVowelSign _$GurmukhiVowelSignFromJson(Map<String, dynamic> json) =>
    _GurmukhiVowelSign(
      id: json['id'] as String,
      sign: json['sign'] as String,
      name: json['name'] as String,
      soundRomanised: json['soundRomanised'] as String,
      exampleForm: json['exampleForm'] as String?,
      verificationStatus:
          $enumDecodeNullable(
            _$VerificationStatusEnumMap,
            json['verificationStatus'],
          ) ??
          VerificationStatus.unverified,
    );

Map<String, dynamic> _$GurmukhiVowelSignToJson(_GurmukhiVowelSign instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sign': instance.sign,
      'name': instance.name,
      'soundRomanised': instance.soundRomanised,
      'exampleForm': instance.exampleForm,
      'verificationStatus':
          _$VerificationStatusEnumMap[instance.verificationStatus]!,
    };

const _$VerificationStatusEnumMap = {
  VerificationStatus.unverified: 'unverified',
  VerificationStatus.inReview: 'inReview',
  VerificationStatus.verified: 'verified',
};
