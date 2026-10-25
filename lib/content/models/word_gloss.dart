import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_gloss.freezed.dart';
part 'word_gloss.g.dart';

/// A word-by-word gloss used in sentence breakdowns so learners can see how a
/// Punjabi sentence is constructed rather than memorising it whole.
@freezed
abstract class WordGloss with _$WordGloss {
  const factory WordGloss({
    required String gurmukhi,
    String? romanised,
    required String meaning,
    String? grammarNote,
  }) = _WordGloss;

  factory WordGloss.fromJson(Map<String, dynamic> json) =>
      _$WordGlossFromJson(json);
}
