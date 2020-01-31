import 'dart:io';

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
void main() {
  _setTargetPlatformForDesktop();
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
              color: Colors.yellowAccent,
              tone: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class MusicKey extends StatefulWidget {
  final color = Colors.white;
  final tone = 1;
  MusicKey({
    Key key,
    Color color = Colors.green,
    int tone = 1,
  }) : super(key: key);
  @override
  _MusicKeyState createState() => _MusicKeyState();
}

class _MusicKeyState extends State<MusicKey> {
  void activate() {
    //animate to larger scale
    //play sound
    SoundPlayerUtil.addSoundName('note$widget.tone.wav');
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
  static void addSoundName(String name, {int count = 1}) {
    for (var i = 0; i < count; i++) {
//      AudioPlayer.addSound('assets/' + name);
    }
  }

  static void removeAllSound() {
//    AudioPlayer.removeAllSound();
  }
}
