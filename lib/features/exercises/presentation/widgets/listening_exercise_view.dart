import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../content/models/punjabi_line.dart';
import '../../../../core/audio/audio_service.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/audio_controls.dart';
import '../../../../shared/widgets/punjabi_text.dart';

/// Listening exercise prompt. Plays the line's audio when a recording
/// exists; when it doesn't, the transcript is revealed with a clear
/// placeholder notice so the lesson remains completable — this is a content
/// gap, presented honestly rather than faked with TTS.
class ListeningExerciseView extends ConsumerStatefulWidget {
  const ListeningExerciseView({required this.prompt, super.key});

  final PunjabiLine prompt;

  @override
  ConsumerState<ListeningExerciseView> createState() =>
      _ListeningExerciseViewState();
}

class _ListeningExerciseViewState extends ConsumerState<ListeningExerciseView> {
  bool? _hasAudio;

  @override
  void initState() {
    super.initState();
    ref.read(audioServiceProvider).hasAudio(widget.prompt.audioRef).then((v) {
      if (mounted) setState(() => _hasAudio = v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.headphones_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text('Listen', style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                AudioControls(widget.prompt.audioRef),
              ],
            ),
            if (_hasAudio == false) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                'No recording yet — showing the transcript instead.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              PunjabiText(widget.prompt),
            ],
          ],
        ),
      ),
    );
  }
}
