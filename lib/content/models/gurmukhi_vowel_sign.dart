import 'package:freezed_annotation/freezed_annotation.dart';

import 'vocabulary_item.dart';

part 'gurmukhi_vowel_sign.freezed.dart';
part 'gurmukhi_vowel_sign.g.dart';

/// A Gurmukhi vowel sign (laga matra). Signs attach to a consonant or vowel
/// carrier; [exampleForm] shows the sign applied to ਸ (sa).
@freezed
abstract class GurmukhiVowelSign with _$GurmukhiVowelSign {
  const factory GurmukhiVowelSign({
    required String id,
    required String sign,
    required String name,
    required String soundRomanised,
    String? exampleForm,
    @Default(VerificationStatus.unverified)
    VerificationStatus verificationStatus,
  }) = _GurmukhiVowelSign;

  factory GurmukhiVowelSign.fromJson(Map<String, dynamic> json) =>
      _$GurmukhiVowelSignFromJson(json);
}
