import 'package:flutter/material.dart';

import 'soundplayerutil.dart';

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
