import 'package:freezed_annotation/freezed_annotation.dart';

import 'punjabi_line.dart';
import 'vocabulary_item.dart';

part 'gurmukhi_letter.freezed.dart';
part 'gurmukhi_letter.g.dart';

@freezed
abstract class GurmukhiLetter with _$GurmukhiLetter {
  const factory GurmukhiLetter({
    required String id,
    required String letter,
    required String name,
    required String soundRomanised,
    String? audioRef,
    PunjabiLine? exampleWord,
    @Default(VerificationStatus.unverified)
    VerificationStatus verificationStatus,
  }) = _GurmukhiLetter;

  factory GurmukhiLetter.fromJson(Map<String, dynamic> json) =>
      _$GurmukhiLetterFromJson(json);
}
