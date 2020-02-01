import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_audio_player/flutter_audio_player.dart';

ThemeData appTheme = new ThemeData(
  primaryColor: const Color(0xFF03A9F4),
  primaryColorDark: const Color(0xFF0288D1),
  primaryColorLight: const Color(0xFFB3E5FC),
  accentColor: const Color(0xFFFFC107),
  dividerColor: const Color(0xFFBDBDBD),
  canvasColor: const Color(0xFFfafafa),
  textSelectionColor: const Color(0xFF757575),
);

final player = AudioPlayer(playerId: 'my_unique_playerId');

void main() {
  _setTargetPlatformForDesktop();
  SoundPlayerUtil.loadAllSound();
  runApp(MyApp());
}

void _setTargetPlatformForDesktop() {
  // No need to handle macOS, as it has now been added to TargetPlatform.
  if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Xylophone',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: appTheme.primaryColorDark,
        ),
        body: SafeArea(
          child: Container(
            child: MusicKey(
              color: Colors.yellow,
              tone: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class MusicKey extends StatefulWidget {
  final Color color;
  final int tone;

  MusicKey({
    Key key,
    this.color,
    this.tone,
  }) : super(key: key);
  @override
  _MusicKeyState createState() => _MusicKeyState();
}

class _MusicKeyState extends State<MusicKey> {
  void activate() {
    //animate to larger scale
    //play sound
    SoundPlayerUtil.addSoundName('assets/note$widget.tone.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: widget.color,
      child: FlatButton(
          onPressed: () {
            setState(() {
              //play sound
              activate();
            });
          },
          child: null),
    );
  }
}

class SoundPlayerUtil {
  static AudioCache player = AudioCache();
  static void addSoundName(String name, {int count = 1}) {
    SoundPlayerUtil.player.play(name);
//    SoundPlayerUtil.player.play(name);
  }

  static void loadAllSound() {
    SoundPlayerUtil.player.loadAll([
      'assets/note1.wav',
      'assets/note2.wav',
      'assets/note3.wav',
      'assets/note4.wav',
      'assets/note5.wav',
      'assets/note6.wav',
      'assets/note7.wav'
    ]);
  }

  static void removeAllSound() {
    SoundPlayerUtil.player.clearCache();
  }
}
