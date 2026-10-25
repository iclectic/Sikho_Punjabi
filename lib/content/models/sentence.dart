import 'package:freezed_annotation/freezed_annotation.dart';

import 'punjabi_line.dart';
import 'word_gloss.dart';

part 'sentence.freezed.dart';
part 'sentence.g.dart';

/// An example sentence, optionally with a word-by-word gloss.
@freezed
abstract class Sentence with _$Sentence {
  const factory Sentence({
    required PunjabiLine line,
    @Default([]) List<WordGloss> glosses,
    String? note,
  }) = _Sentence;

  factory Sentence.fromJson(Map<String, dynamic> json) =>
      _$SentenceFromJson(json);
}
