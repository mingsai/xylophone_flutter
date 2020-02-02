import 'package:flutter/material.dart';

import 'musickey.dart';

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
