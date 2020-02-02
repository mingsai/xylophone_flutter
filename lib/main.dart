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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MusicKeyRow(
                color: Colors.yellow,
                tone: 1,
              ),
              MusicKeyRow(
                color: Colors.redAccent,
                tone: 2,
              ),
              MusicKeyRow(
                color: Colors.purple,
                tone: 3,
              ),
              MusicKeyRow(
                color: Colors.orangeAccent,
                tone: 4,
              ),
              MusicKeyRow(
                color: Colors.lightGreen,
                tone: 5,
              ),
              MusicKeyRow(
                color: Colors.brown,
                tone: 6,
              ),
              MusicKeyRow(
                color: Colors.amberAccent,
                tone: 7,
              ),
            ],
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
    final int tone = widget.tone;
    SoundPlayerUtil.addSoundName('note$tone.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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

class MusicKeyRow extends StatefulWidget {
  final Color color;
  final int tone;

  MusicKeyRow({
    Key key,
    this.color,
    this.tone,
  }) : super(key: key);

  @override
  _MusicKeyRowState createState() => _MusicKeyRowState();
}

class _MusicKeyRowState extends State<MusicKeyRow> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MusicKey(
        color: widget.color,
        tone: widget.tone,
      ),
    );
  }
}
