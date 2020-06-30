import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        IconButton(icon: Icon(Icons.restore, color: Colors.purple[900]), onPressed: () => print("Play clicked")),
        IconButton(icon: Icon(Icons.settings, color: Colors.purple[900]), onPressed: () => print("Settings clicked")),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}