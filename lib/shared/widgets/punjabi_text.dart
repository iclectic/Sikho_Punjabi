import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../content/models/punjabi_line.dart';
import '../../core/theme/app_tokens.dart';
import '../../features/settings/domain/settings.dart';

/// Renders a [PunjabiLine] honouring the learner's [ScriptDisplayMode].
/// Gurmukhi is the primary line; romanisation and English are secondary.
class PunjabiText extends ConsumerWidget {
  const PunjabiText(
    this.line, {
    super.key,
    this.mode,
    this.gurmukhiStyle,
    this.romanisedStyle,
    this.englishStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final PunjabiLine line;

  /// Overrides the user's global script preference when set.
  final ScriptDisplayMode? mode;
  final TextStyle? gurmukhiStyle;
  final TextStyle? romanisedStyle;
  final TextStyle? englishStyle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveMode = mode ?? ref.watch(settingsProvider).scriptDisplayMode;
    final theme = Theme.of(context).textTheme;

    final gurmukhi = gurmukhiStyle ?? theme.titleLarge;
    final romanised = (romanisedStyle ?? theme.bodyMedium)?.copyWith(
      fontStyle: FontStyle.italic,
    );
    final english = (englishStyle ?? theme.bodyMedium)?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    final showGurmukhi = switch (effectiveMode) {
      ScriptDisplayMode.romanisedEnglish => false,
      _ => true,
    };
    final showRomanised = switch (effectiveMode) {
      ScriptDisplayMode.gurmukhiRomanisedEnglish ||
      ScriptDisplayMode.romanisedEnglish => true,
      _ => false,
    };
    final showEnglish = switch (effectiveMode) {
      ScriptDisplayMode.punjabiOnly => false,
      _ => true,
    };

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showGurmukhi)
          Semantics(
            label:
                'Punjabi: ${line.gurmukhi}'
                '${line.romanised != null ? ", pronounced ${line.romanised}" : ""}'
                '${line.english != null ? ", meaning ${line.english}" : ""}',
            child: Text(line.gurmukhi, style: gurmukhi),
          ),
        if (showRomanised && line.romanised != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(line.romanised!, style: romanised),
          ),
        if (showEnglish && line.english != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(line.english!, style: english),
          ),
      ],
    );
  }
}
