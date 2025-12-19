import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stillspace/features/sound/domain/soundscape.dart';

class SoundService {
  final AudioPlayer _player = AudioPlayer();
  Timer? _fadeTimer;

  Future<void> play(Soundscape sound) async {
    try {
      debugPrint('Trying to load asset: ${sound.assetPath}');
      await _player.setAsset(sound.assetPath);
      debugPrint('Asset loaded successfully');
    } catch (e) {
      debugPrint('❌ ASSET LOAD FAILED: $e');
      return;
    }

    await _player.setLoopMode(LoopMode.one);
    await _player.setVolume(0.0);
    _player.play();

    _fadeTo(1.0, const Duration(seconds: 4));
  }

  Future<void> stop() async {
    await _fadeTo(0.0, const Duration(seconds: 3));
    await _player.stop();
  }

  Future<void> _fadeTo(double target, Duration duration) async {
    _fadeTimer?.cancel();

    const steps = 20;
    final stepDuration = duration ~/ steps;
    final startVolume = _player.volume;
    final delta = (target - startVolume) / steps;

    int currentStep = 0;
    _fadeTimer = Timer.periodic(stepDuration, (timer) {
      currentStep++;
      final newVolume =
      (startVolume + delta * currentStep).clamp(0.0, 1.0);

      _player.setVolume(newVolume);

      if (currentStep >= steps) {
        timer.cancel();
      }
    });
  }

  void dispose() {
    _fadeTimer?.cancel();
    _player.dispose();
  }
}
