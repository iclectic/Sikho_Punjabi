import 'package:flutter/material.dart';

import '../../../../content/models/lesson.dart';
import '../../../../content/models/vocabulary_item.dart';
import '../../../../content/models/word_gloss.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/punjabi_text.dart';
import '../../../exercises/presentation/exercise_runner.dart';

/// Renders any [LessonSection] as a scrollable page inside the lesson player.
class SectionView extends StatelessWidget {
  const SectionView({required this.lessonId, required this.section, super.key});

  final String lessonId;
  final LessonSection section;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: [
        Text(_heading, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.lg),
        ...switch (section) {
          IntroSection s => [Text(s.body, style: _body(context))],
          VocabularySection s => [
            for (final item in s.items) _VocabTile(item: item),
          ],
          ExamplesSection s => [
            for (final sentence in s.sentences)
              Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Padding(
                  padding: AppSpacing.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PunjabiText(sentence.line),
                      if (sentence.glosses.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.sm),
                        _GlossRow(glosses: sentence.glosses),
                      ],
                      if (sentence.note != null) ...[
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          sentence.note!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
          BreakdownSection s => [
            Card(
              child: Padding(
                padding: AppSpacing.cardPadding,
                child: PunjabiText(s.sentence.line),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _GlossRow(glosses: s.glosses),
            if (s.note != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: Text(s.note!, style: _body(context)),
              ),
          ],
          GrammarSection s => [Text(s.body, style: _body(context))],
          WhyThisWaySection s => [
            Card(
              color: Theme.of(
                context,
              ).colorScheme.secondaryContainer.withValues(alpha: 0.4),
              child: Padding(
                padding: AppSpacing.cardPadding,
                child: Text(s.body, style: _body(context)),
              ),
            ),
          ],
          ConversationSection s => [
            if (s.conversation.context.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Text(
                  s.conversation.context,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            for (final line in s.conversation.lines)
              Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Padding(
                  padding: AppSpacing.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        line.speaker,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      PunjabiText(line.line),
                    ],
                  ),
                ),
              ),
          ],
          ExerciseSetSection s => [
            ExerciseRunner(lessonId: lessonId, exercises: s.exercises),
          ],
          SummarySection s => [
            Text(s.body, style: _body(context)),
            const SizedBox(height: AppSpacing.md),
            for (final point in s.keyPoints)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.check_circle_outline, size: 20),
                title: Text(point),
              ),
          ],
        },
      ],
    );
  }

  String get _heading => switch (section) {
    IntroSection s => s.heading,
    VocabularySection s => s.heading,
    ExamplesSection s => s.heading,
    BreakdownSection s => s.heading,
    GrammarSection s => s.heading,
    WhyThisWaySection s => s.heading,
    ConversationSection s => s.heading,
    ExerciseSetSection s => s.heading,
    SummarySection s => s.heading,
  };

  TextStyle? _body(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5);
}

class _VocabTile extends StatelessWidget {
  const _VocabTile({required this.item});

  final VocabularyItem item;

  @override
  Widget build(BuildContext context) {
    final subtitle = [
      if (item.partOfSpeech != null) item.partOfSpeech!,
      if (item.usageNote != null) item.usageNote!,
    ].join(' · ');

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        title: PunjabiText(item.term),
        subtitle: subtitle.isEmpty ? null : Text(subtitle),
      ),
    );
  }
}

class _GlossRow extends StatelessWidget {
  const _GlossRow({required this.glosses});

  final List<WordGloss> glosses;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      children: [
        for (final gloss in glosses)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                gloss.gurmukhi,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (gloss.romanised != null)
                Text(
                  gloss.romanised!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                ),
              Text(gloss.meaning, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
      ],
    );
  }
}
