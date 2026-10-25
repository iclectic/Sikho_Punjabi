import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

/// Reference to a lesson file on disk, plus its ordering metadata. Keeping
/// lesson bodies in separate JSON files lets reviewers edit lessons without
/// touching the course skeleton.
@freezed
abstract class LessonRef with _$LessonRef {
  const factory LessonRef({
    required String id,
    required String title,
    required String file,
    @Default(15) int estimatedMinutes,
  }) = _LessonRef;

  factory LessonRef.fromJson(Map<String, dynamic> json) =>
      _$LessonRefFromJson(json);
}

@freezed
abstract class Module with _$Module {
  const factory Module({
    required String id,
    required String title,
    String? description,
    @Default([]) List<LessonRef> lessons,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}

@freezed
abstract class Level with _$Level {
  const factory Level({
    required String id,
    required String title,
    required int order,
    String? description,
    @Default([]) List<Module> modules,
  }) = _Level;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}

@freezed
abstract class Course with _$Course {
  const factory Course({
    required String id,
    required String title,
    String? description,
    @Default(1) int contentVersion,
    @Default([]) List<Level> levels,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
