import 'package:freezed_annotation/freezed_annotation.dart';

import 'punjabi_line.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
abstract class ConversationLine with _$ConversationLine {
  const factory ConversationLine({
    required String speaker,
    required PunjabiLine line,
  }) = _ConversationLine;

  factory ConversationLine.fromJson(Map<String, dynamic> json) =>
      _$ConversationLineFromJson(json);
}

/// A short scripted exchange inside a lesson. Scenario-based conversations
/// (Phase: conversations feature) reuse this model with looser structure.
@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String title,
    @Default('') String context,
    @Default([]) List<ConversationLine> lines,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
