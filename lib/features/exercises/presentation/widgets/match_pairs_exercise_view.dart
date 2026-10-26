import 'package:flutter/material.dart';

import '../../../../content/models/exercise.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/punjabi_text.dart';

/// Two-column pairing exercise: tap a left item, then tap the right item it
/// matches. Paired items lock in place; the check runs once everything is
/// paired.
class MatchPairsExerciseView extends StatefulWidget {
  const MatchPairsExerciseView({
    required this.instructions,
    required this.pairs,
    required this.onSubmit,
    super.key,
  });

  final String instructions;
  final List<MatchPair> pairs;
  final ValueChanged<Map<String, String>> onSubmit;

  @override
  State<MatchPairsExerciseView> createState() => _MatchPairsExerciseViewState();
}

class _MatchPairsExerciseViewState extends State<MatchPairsExerciseView> {
  /// pairId of the currently selected left item.
  String? _selectedLeft;

  /// Completed pairings: left pairId → right pairId.
  final Map<String, String> _pairings = {};

  /// Right column order, shuffled once so positions are stable during play.
  late final List<MatchPair> _rightOrder = [...widget.pairs]..shuffle();

  bool _submitted = false;

  void _selectLeft(String pairId) {
    if (_submitted || _pairings.containsKey(pairId)) return;
    setState(() => _selectedLeft = pairId);
  }

  void _selectRight(String rightPairId) {
    if (_submitted || _selectedLeft == null) return;
    if (_pairings.containsValue(rightPairId)) return;
    setState(() {
      _pairings[_selectedLeft!] = rightPairId;
      _selectedLeft = null;
    });
  }

  bool get _complete => _pairings.length == widget.pairs.length;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.instructions,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Tap an item on the left, then its match on the right.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final pair in widget.pairs)
                    _sideButton(pair, isLeft: true, scheme: scheme),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                children: [
                  for (final pair in _rightOrder)
                    _sideButton(pair, isLeft: false, scheme: scheme),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        FilledButton(
          onPressed: !_complete || _submitted
              ? null
              : () {
                  setState(() => _submitted = true);
                  widget.onSubmit(Map.unmodifiable(_pairings));
                },
          child: const Text('Check'),
        ),
      ],
    );
  }

  Widget _sideButton(
    MatchPair pair, {
    required bool isLeft,
    required ColorScheme scheme,
  }) {
    final paired =
        _pairings.containsKey(pair.id) || _pairings.containsValue(pair.id);
    final selected = isLeft && _selectedLeft == pair.id;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: paired
                ? scheme.primaryContainer.withValues(alpha: 0.5)
                : selected
                ? scheme.secondaryContainer
                : null,
          ),
          onPressed: paired
              ? null
              : () => isLeft ? _selectLeft(pair.id) : _selectRight(pair.id),
          child: PunjabiText(
            isLeft ? pair.left : pair.right,
            gurmukhiStyle: Theme.of(context).textTheme.bodyMedium,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
