enum Soundscape {
  sound1,
  sound2,
  sound3,
}

extension SoundscapeX on Soundscape {
  String get assetPath{
    switch(this) {
      case Soundscape.sound1:
        return 'assets/sounds/sound_1.mp3';
      case Soundscape.sound2:
        return 'assets/sounds/sound_2.mp3';
      case Soundscape.sound3:
        return 'assets/sounds/sound_3.mp3';
    }
  }

  String get label{
    switch(this) {
      case Soundscape.sound1:
        return 'Sound 1';
      case Soundscape.sound2:
        return 'Sound 2';
      case Soundscape.sound3:
        return 'Sound 3';
    }
  }
}