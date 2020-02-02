import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'musickey_row.dart';
import 'soundplayerutil.dart';

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
