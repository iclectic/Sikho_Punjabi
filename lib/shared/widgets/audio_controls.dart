import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/audio/audio_service.dart';

/// Normal-speed + slow playback buttons for a content [audioRef].
///
/// When no recording exists the buttons render disabled with an honest
/// tooltip — recorded audio is a content gap, not a code gap. When assets
/// are added under `assets/audio/`, playback works with no further changes.
class AudioControls extends ConsumerStatefulWidget {
  const AudioControls(this.audioRef, {super.key, this.size = 20});

  final String? audioRef;
  final double size;

  @override
  ConsumerState<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends ConsumerState<AudioControls> {
  late final AudioService _audio;
  bool? _available;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    // ref.read is unsafe in dispose() — capture the service once.
    _audio = ref.read(audioServiceProvider);
    _probe();
  }

  @override
  void didUpdateWidget(AudioControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioRef != widget.audioRef) _probe();
  }

  Future<void> _probe() async {
    final available = await _audio.hasAudio(widget.audioRef);
    if (mounted) setState(() => _available = available);
  }

  Future<void> _play(double speed) async {
    final ref0 = widget.audioRef;
    if (ref0 == null) return;
    setState(() => _playing = true);
    try {
      await _audio.play(ref0, speed: speed);
    } finally {
      if (mounted) setState(() => _playing = false);
    }
  }

  @override
  void dispose() {
    _audio.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final available = _available == true;
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: widget.size,
          visualDensity: VisualDensity.compact,
          tooltip: available ? 'Play' : 'No recording yet',
          onPressed: available && !_playing ? () => _play(1.0) : null,
          icon: Icon(
            _playing ? Icons.volume_up : Icons.play_circle_outline,
            color: available ? null : scheme.outline,
          ),
        ),
        IconButton(
          iconSize: widget.size,
          visualDensity: VisualDensity.compact,
          tooltip: available ? 'Play slowly' : 'No recording yet',
          onPressed: available && !_playing ? () => _play(0.65) : null,
          icon: Icon(
            Icons.slow_motion_video,
            color: available ? null : scheme.outline,
          ),
        ),
      ],
    );
  }
}
