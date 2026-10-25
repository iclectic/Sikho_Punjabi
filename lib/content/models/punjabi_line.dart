import 'package:freezed_annotation/freezed_annotation.dart';

part 'punjabi_line.freezed.dart';
part 'punjabi_line.g.dart';

/// A single unit of Punjabi content with its three representations.
///
/// Every translatable string in the course is a [PunjabiLine] so that
/// Gurmukhi, romanisation, English, and audio can be reviewed and edited
/// independently by native speakers.
@freezed
abstract class PunjabiLine with _$PunjabiLine {
  const factory PunjabiLine({
    required String gurmukhi,
    String? romanised,
    String? english,
    String? audioRef,
  }) = _PunjabiLine;

  factory PunjabiLine.fromJson(Map<String, dynamic> json) =>
      _$PunjabiLineFromJson(json);
}
