import 'package:audioplayers/audio_cache.dart';

class SoundPlayerUtil {
  static AudioCache player = AudioCache();
  static void addSoundName(String name, {int count = 1}) {
    SoundPlayerUtil.player.play(name);
  }

  static void loadAllSound() {
    SoundPlayerUtil.player.loadAll([
      'note1.wav',
      'note2.wav',
      'note3.wav',
      'note4.wav',
      'note5.wav',
      'note6.wav',
      'note7.wav'
    ]);
  }

  static void removeAllSound() {
    SoundPlayerUtil.player.clearCache();
  }
}
