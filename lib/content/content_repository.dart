import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/course.dart';
import 'models/gurmukhi_letter.dart';
import 'models/lesson.dart';

/// Contract for course content. Implementations may read bundled assets
/// (offline) or a remote content service later; callers never depend on the
/// storage mechanism.
abstract interface class ContentRepository {
  Future<Course> getCourse();
  Future<Lesson> getLesson(String lessonId);
  Future<List<GurmukhiLetter>> getGurmukhiLetters();
}

class ContentNotFoundException implements Exception {
  const ContentNotFoundException(this.id);
  final String id;

  @override
  String toString() => 'ContentNotFoundException: $id';
}

/// Loads versioned JSON course content bundled with the app.
class AssetContentRepository implements ContentRepository {
  AssetContentRepository({this.basePath = 'assets/content'});

  final String basePath;

  static const _coursePath = 'courses/beginner_punjabi/course.json';
  static const _gurmukhiPath = 'gurmukhi/letters.json';

  Course? _courseCache;
  final Map<String, Lesson> _lessonCache = {};
  List<GurmukhiLetter>? _lettersCache;

  Future<Map<String, dynamic>> _readJson(String path) async {
    final raw = await rootBundle.loadString('$basePath/$path');
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<Course> getCourse() async {
    return _courseCache ??= Course.fromJson(await _readJson(_coursePath));
  }

  @override
  Future<Lesson> getLesson(String lessonId) async {
    final cached = _lessonCache[lessonId];
    if (cached != null) return cached;

    final course = await getCourse();
    LessonRef? ref;
    for (final level in course.levels) {
      for (final module in level.modules) {
        for (final l in module.lessons) {
          if (l.id == lessonId) ref = l;
        }
      }
    }
    if (ref == null) throw ContentNotFoundException(lessonId);

    final lesson = Lesson.fromJson(await _readJson(ref.file));
    _lessonCache[lessonId] = lesson;
    return lesson;
  }

  @override
  Future<List<GurmukhiLetter>> getGurmukhiLetters() async {
    final cached = _lettersCache;
    if (cached != null) return cached;

    final json = await _readJson(_gurmukhiPath);
    final list = (json['letters'] as List<dynamic>)
        .map((e) => GurmukhiLetter.fromJson(e as Map<String, dynamic>))
        .toList();
    return _lettersCache = list;
  }
}

final contentRepositoryProvider = Provider<ContentRepository>(
  (ref) => AssetContentRepository(),
);

final courseProvider = FutureProvider<Course>(
  (ref) => ref.watch(contentRepositoryProvider).getCourse(),
);

final lessonProvider = FutureProvider.family<Lesson, String>(
  (ref, lessonId) => ref.watch(contentRepositoryProvider).getLesson(lessonId),
);

final gurmukhiLettersProvider = FutureProvider<List<GurmukhiLetter>>(
  (ref) => ref.watch(contentRepositoryProvider).getGurmukhiLetters(),
);
