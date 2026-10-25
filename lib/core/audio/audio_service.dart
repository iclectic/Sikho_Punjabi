import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

/// Abstraction over pronunciation playback. Content references audio by an
/// opaque [audioRef]; the service resolves it to a bundled asset or (later) a
/// cached remote file. Missing audio is a normal state — lessons must work
/// without it until native recordings exist.
abstract interface class AudioService {
  /// Whether audio exists for [audioRef]. Null/unknown refs return false.
  Future<bool> hasAudio(String? audioRef);
  Future<void> play(String audioRef, {double speed});
  Future<void> stop();
  Future<void> dispose();
}

class JustAudioService implements AudioService {
  JustAudioService() : _player = AudioPlayer();

  final AudioPlayer _player;

  @override
  Future<bool> hasAudio(String? audioRef) async {
    // No bundled recordings yet; refs exist in content for future use.
    return false;
  }

  @override
  Future<void> play(String audioRef, {double speed = 1.0}) async {
    await _player.setAsset('assets/audio/$audioRef');
    await _player.setSpeed(speed);
    await _player.play();
  }

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> dispose() => _player.dispose();
}

final audioServiceProvider = Provider<AudioService>((ref) {
  final service = JustAudioService();
  ref.onDispose(service.dispose);
  return service;
});
