import 'package:freezed_annotation/freezed_annotation.dart';

import 'punjabi_line.dart';

part 'vocabulary_item.freezed.dart';
part 'vocabulary_item.g.dart';

/// Lifecycle marker for content correctness. Everything in the sample course
/// ships as `unverified` until a native Punjabi speaker has reviewed it.
enum VerificationStatus { unverified, inReview, verified }

@freezed
abstract class VocabularyItem with _$VocabularyItem {
  const factory VocabularyItem({
    required String id,
    required PunjabiLine term,
    String? partOfSpeech,
    String? usageNote,
    @Default(VerificationStatus.unverified)
    VerificationStatus verificationStatus,
  }) = _VocabularyItem;

  factory VocabularyItem.fromJson(Map<String, dynamic> json) =>
      _$VocabularyItemFromJson(json);
}
