// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonRef _$LessonRefFromJson(Map<String, dynamic> json) => _LessonRef(
  id: json['id'] as String,
  title: json['title'] as String,
  file: json['file'] as String,
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt() ?? 15,
);

Map<String, dynamic> _$LessonRefToJson(_LessonRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': instance.file,
      'estimatedMinutes': instance.estimatedMinutes,
    };

_Module _$ModuleFromJson(Map<String, dynamic> json) => _Module(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  lessons:
      (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ModuleToJson(_Module instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'lessons': instance.lessons,
};

_Level _$LevelFromJson(Map<String, dynamic> json) => _Level(
  id: json['id'] as String,
  title: json['title'] as String,
  order: (json['order'] as num).toInt(),
  description: json['description'] as String?,
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LevelToJson(_Level instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'order': instance.order,
  'description': instance.description,
  'modules': instance.modules,
};

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  contentVersion: (json['contentVersion'] as num?)?.toInt() ?? 1,
  levels:
      (json['levels'] as List<dynamic>?)
          ?.map((e) => Level.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'contentVersion': instance.contentVersion,
  'levels': instance.levels,
};
