import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/models/punjabi_line.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/punjabi_text.dart';
import '../../settings/domain/settings.dart';
import '../application/review_providers.dart';
import '../domain/srs_scheduler.dart';

/// Due-flashcard review session. Cards flip to reveal the answer; self-ratings
/// reschedule via [SrsScheduler].
class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final due = ref.watch(dueFlashcardsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Review')),
      body: due.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load cards: $e')),
        data: (cards) =>
            cards.isEmpty ? const _EmptyReview() : _ReviewSession(cards: cards),
      ),
    );
  }
}

class _EmptyReview extends ConsumerWidget {
  const _EmptyReview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecast = ref.watch(dueForecastProvider);
    final upcoming = forecast.skip(1).fold<int>(0, (sum, n) => sum + n);
    final nextDay = forecast.indexWhere((n) => n > 0);

    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline, size: 56),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Nothing due right now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              upcoming == 0
                  ? 'Flashcards appear here after you study a lesson\'s vocabulary.'
                  : 'Next: ${forecast[nextDay]} card${forecast[nextDay] == 1 ? '' : 's'} ${_dayLabel(nextDay)} — $upcoming due this week.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  static String _dayLabel(int offset) => switch (offset) {
    0 => 'today',
    1 => 'tomorrow',
    _ => 'in $offset days',
  };
}

class _ReviewSession extends ConsumerStatefulWidget {
  const _ReviewSession({required this.cards});

  final List<FlashcardsTableData> cards;

  @override
  ConsumerState<_ReviewSession> createState() => _ReviewSessionState();
}

class _ReviewSessionState extends ConsumerState<_ReviewSession> {
  int _index = 0;
  bool _revealed = false;
  final _ratings = <ReviewRating>[];

  Future<void> _rate(ReviewRating rating) async {
    final card = widget.cards[_index];
    await ref.read(reviewActionsProvider).rate(card, rating);
    if (!mounted) return;
    setState(() {
      _ratings.add(rating);
      _revealed = false;
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_index >= widget.cards.length) {
      return _SessionSummary(ratings: _ratings);
    }
    final card = widget.cards[_index];
    final line = PunjabiLine(
      gurmukhi: card.gurmukhi,
      romanised: card.romanised,
      english: card.english,
      audioRef: card.audioRef,
    );

    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        children: [
          Text(
            'Card ${_index + 1} of ${widget.cards.length}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () => setState(() => _revealed = !_revealed),
                child: Center(
                  child: Padding(
                    padding: AppSpacing.cardPadding,
                    child: _revealed
                        ? PunjabiText(
                            line,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            gurmukhiStyle: Theme.of(
                              context,
                            ).textTheme.headlineMedium,
                          )
                        : PunjabiText(
                            line,
                            mode: ScriptDisplayMode.punjabiOnly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            gurmukhiStyle: Theme.of(
                              context,
                            ).textTheme.headlineMedium,
                          ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (!_revealed)
            Text(
              'Tap the card to reveal',
              style: Theme.of(context).textTheme.bodySmall,
            )
          else
            Row(
              children: [
                for (final rating in ReviewRating.values) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _rate(rating),
                      child: Text(switch (rating) {
                        ReviewRating.again => 'Again',
                        ReviewRating.hard => 'Hard',
                        ReviewRating.good => 'Good',
                        ReviewRating.easy => 'Easy',
                      }),
                    ),
                  ),
                  if (rating != ReviewRating.easy)
                    const SizedBox(width: AppSpacing.sm),
                ],
              ],
            ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

/// End-of-session recap: cards worked through, per-rating counts, and a
/// recall-rate proxy so the learner sees honest feedback, not a score chase.
class _SessionSummary extends StatelessWidget {
  const _SessionSummary({required this.ratings});

  final List<ReviewRating> ratings;

  @override
  Widget build(BuildContext context) {
    final counts = {for (final r in ReviewRating.values) r: 0};
    for (final r in ratings) {
      counts[r] = counts[r]! + 1;
    }
    final remembered = counts[ReviewRating.good]! + counts[ReviewRating.easy]!;

    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration_outlined, size: 56),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Session complete',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${ratings.length} card${ratings.length == 1 ? '' : 's'} reviewed — '
              '$remembered remembered well',
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final rating in ReviewRating.values)
                  Chip(label: Text('${_label(rating)}: ${counts[rating]}')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _label(ReviewRating rating) => switch (rating) {
    ReviewRating.again => 'Again',
    ReviewRating.hard => 'Hard',
    ReviewRating.good => 'Good',
    ReviewRating.easy => 'Easy',
  };
}
