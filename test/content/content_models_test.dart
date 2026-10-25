import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sikho_punjabi/content/models/course.dart';
import 'package:sikho_punjabi/content/models/exercise.dart';
import 'package:sikho_punjabi/content/models/lesson.dart';

Map<String, dynamic> _loadJson(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

void main() {
  group('content JSON parsing', () {
    test('course.json parses with expected structure', () {
      final course = Course.fromJson(
        _loadJson('assets/content/courses/beginner_punjabi/course.json'),
      );

      expect(course.id, 'beginner_punjabi');
      expect(course.levels, isNotEmpty);

      final level1 = course.levels.first;
      expect(level1.modules.first.lessons.length, greaterThanOrEqualTo(2));
      expect(level1.modules.first.lessons.first.file, endsWith('.json'));
    });

    test('greetings lesson parses all section types', () {
      final lesson = Lesson.fromJson(
        _loadJson(
          'assets/content/courses/beginner_punjabi/lessons/greetings.json',
        ),
      );

      expect(lesson.id, 'l1_m1_greetings');
      expect(lesson.sections, isNotEmpty);

      final types = lesson.sections.map((s) => s.runtimeType).toSet();
      expect(
        types,
        containsAll(<Type>{
          IntroSection,
          VocabularySection,
          ExamplesSection,
          BreakdownSection,
          GrammarSection,
          WhyThisWaySection,
          ConversationSection,
          ExerciseSetSection,
          SummarySection,
        }),
      );

      final vocab = lesson.sections.whereType<VocabularySection>().first;
      expect(vocab.items.length, greaterThanOrEqualTo(5));
      expect(vocab.items.first.term.gurmukhi, isNotEmpty);
      expect(vocab.items.first.term.romanised, isNotNull);

      final exercises = lesson.sections
          .whereType<ExerciseSetSection>()
          .first
          .exercises;
      expect(
        exercises.whereType<MultipleChoiceExercise>().length,
        greaterThanOrEqualTo(1),
      );
      expect(
        exercises.whereType<ArrangeWordsExercise>().length,
        greaterThanOrEqualTo(1),
      );
      expect(
        exercises.whereType<TypeTranslationExercise>().length,
        greaterThanOrEqualTo(1),
      );
    });

    test('introducing-yourself lesson parses exercises incl. fillBlank', () {
      final lesson = Lesson.fromJson(
        _loadJson(
          'assets/content/courses/beginner_punjabi/lessons/introducing_yourself.json',
        ),
      );

      final exercises = lesson.sections
          .whereType<ExerciseSetSection>()
          .first
          .exercises;
      expect(
        exercises.whereType<FillBlankExercise>().single.correctOptionId,
        'a',
      );
    });
  });
}
