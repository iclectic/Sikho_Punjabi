import 'package:freezed_annotation/freezed_annotation.dart';

import 'conversation.dart';
import 'exercise.dart';
import 'sentence.dart';
import 'vocabulary_item.dart';
import 'word_gloss.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

/// Ordered building blocks of a lesson. The `type` key in JSON selects the
/// concrete section, so content authors can reorder/add sections freely.
@Freezed(unionKey: 'type')
sealed class LessonSection with _$LessonSection {
  const factory LessonSection.intro({
    required String heading,
    required String body,
  }) = IntroSection;

  const factory LessonSection.vocabulary({
    required String heading,
    required List<VocabularyItem> items,
  }) = VocabularySection;

  const factory LessonSection.examples({
    required String heading,
    required List<Sentence> sentences,
  }) = ExamplesSection;

  const factory LessonSection.breakdown({
    required String heading,
    required Sentence sentence,
    required List<WordGloss> glosses,
    String? note,
  }) = BreakdownSection;

  const factory LessonSection.grammar({
    required String heading,
    required String body,
  }) = GrammarSection;

  /// "Why is it said this way?" — plain-English structural explanation.
  const factory LessonSection.whyThisWay({
    required String heading,
    required String body,
  }) = WhyThisWaySection;

  const factory LessonSection.conversation({
    required String heading,
    required Conversation conversation,
  }) = ConversationSection;

  const factory LessonSection.exerciseSet({
    required String heading,
    required List<Exercise> exercises,
  }) = ExerciseSetSection;

  const factory LessonSection.summary({
    required String heading,
    required String body,
    @Default([]) List<String> keyPoints,
  }) = SummarySection;

  factory LessonSection.fromJson(Map<String, dynamic> json) =>
      _$LessonSectionFromJson(json);
}

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String moduleId,
    required String title,
    String? subtitle,
    @Default(15) int estimatedMinutes,
    @Default([]) List<LessonSection> sections,
    @Default(VerificationStatus.unverified)
    VerificationStatus verificationStatus,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
