// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VocabularyItem _$VocabularyItemFromJson(Map<String, dynamic> json) =>
    _VocabularyItem(
      id: json['id'] as String,
      term: PunjabiLine.fromJson(json['term'] as Map<String, dynamic>),
      partOfSpeech: json['partOfSpeech'] as String?,
      usageNote: json['usageNote'] as String?,
      verificationStatus:
          $enumDecodeNullable(
            _$VerificationStatusEnumMap,
            json['verificationStatus'],
          ) ??
          VerificationStatus.unverified,
    );

Map<String, dynamic> _$VocabularyItemToJson(_VocabularyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'term': instance.term,
      'partOfSpeech': instance.partOfSpeech,
      'usageNote': instance.usageNote,
      'verificationStatus':
          _$VerificationStatusEnumMap[instance.verificationStatus]!,
    };

const _$VerificationStatusEnumMap = {
  VerificationStatus.unverified: 'unverified',
  VerificationStatus.inReview: 'inReview',
  VerificationStatus.verified: 'verified',
};
