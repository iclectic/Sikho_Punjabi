import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content_repository.dart';
import '../../../content/models/lesson.dart';
import '../../../content/models/vocabulary_item.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../../review/application/review_providers.dart';
import 'widgets/section_views.dart';

/// Steps through a lesson's sections, persists position so a lesson can be
/// left and resumed, seeds flashcards from vocabulary, and marks completion.
class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({required this.lessonId, super.key});

  final String lessonId;

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  final _pageController = PageController();
  late final DateTime _startedAt = DateTime.now();
  int _index = 0;
  bool _restored = false;

  @override
  void dispose() {
    final db = ref.read(appDatabaseProvider);
    unawaited(
      db.logStudySession(
        lessonId: widget.lessonId,
        startedAt: _startedAt,
        durationSeconds: DateTime.now().difference(_startedAt).inSeconds,
      ),
    );
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onPageChanged(int index, Lesson lesson, AppDatabase db) async {
    setState(() => _index = index);
    await db.saveLessonPosition(lesson.id, index);
    final section = lesson.sections[index];
    if (section is VocabularySection) {
      await seedFlashcardsFromLesson(db, lesson);
    }
  }

  Future<void> _finish(Lesson lesson, AppDatabase db) async {
    await db.markLessonCompleted(lesson.id);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final lessonAsync = ref.watch(lessonProvider(widget.lessonId));
    final db = ref.watch(appDatabaseProvider);

    return lessonAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Could not load lesson: $e')),
      ),
      data: (lesson) {
        if (!_restored) {
          _restored = true;
          db.lessonProgress(lesson.id).then((saved) {
            final savedIndex = saved?.lastSectionIndex ?? 0;
            if (savedIndex > 0 &&
                savedIndex < lesson.sections.length &&
                _pageController.hasClients) {
              _pageController.jumpToPage(savedIndex);
              setState(() => _index = savedIndex);
            }
          });
        }

        final isLast = _index == lesson.sections.length - 1;
        return Scaffold(
          appBar: AppBar(
            title: Text(lesson.title),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(6),
              child: LinearProgressIndicator(
                value: lesson.sections.isEmpty
                    ? 1
                    : (_index + 1) / lesson.sections.length,
              ),
            ),
          ),
          body: Column(
            children: [
              if (lesson.verificationStatus == VerificationStatus.unverified)
                const _UnverifiedBanner(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) => _onPageChanged(i, lesson, db),
                  itemCount: lesson.sections.length,
                  itemBuilder: (context, i) =>
                      SectionView(section: lesson.sections[i]),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: AppSpacing.screenPadding,
                  child: Row(
                    children: [
                      if (_index > 0)
                        OutlinedButton(
                          onPressed: () => _pageController.previousPage(
                            duration: AppDurations.normal,
                            curve: Curves.easeOut,
                          ),
                          child: const Text('Back'),
                        ),
                      const Spacer(),
                      FilledButton(
                        onPressed: isLast
                            ? () => _finish(lesson, db)
                            : () => _pageController.nextPage(
                                duration: AppDurations.normal,
                                curve: Curves.easeOut,
                              ),
                        child: Text(isLast ? 'Finish lesson' : 'Continue'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UnverifiedBanner extends StatelessWidget {
  const _UnverifiedBanner();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.unverified.withValues(alpha: 0.15),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            Icon(Icons.fact_check_outlined, size: 18),
            SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'Sample content — pending native-speaker review.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
