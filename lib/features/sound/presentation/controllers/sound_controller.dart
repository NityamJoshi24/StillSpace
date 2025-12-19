import 'package:stillspace/features/sound/data/sound_service.dart';

import '../../domain/soundscape.dart';

class SoundController{
  final SoundService _service;
  Soundscape current = Soundscape.sound1;
  SoundController(this._service);

  void start() {
    _service.play(current);
  }

  void stop() {
    _service.stop();
  }

  void change(Soundscape sound) {
    current = sound;
    start();
  }
}