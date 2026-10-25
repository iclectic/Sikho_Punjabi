// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationLine _$ConversationLineFromJson(Map<String, dynamic> json) =>
    _ConversationLine(
      speaker: json['speaker'] as String,
      line: PunjabiLine.fromJson(json['line'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationLineToJson(_ConversationLine instance) =>
    <String, dynamic>{'speaker': instance.speaker, 'line': instance.line};

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      title: json['title'] as String,
      context: json['context'] as String? ?? '',
      lines:
          (json['lines'] as List<dynamic>?)
              ?.map((e) => ConversationLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'context': instance.context,
      'lines': instance.lines,
    };
