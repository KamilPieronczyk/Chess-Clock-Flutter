import 'package:flutter/material.dart';

class PlayerTimeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FlatButton(
        onPressed: () => print("object"),
        child: Text('5:00', style: textStyle),
        color: Colors.orangeAccent[400],
      ),
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
    );
  }
  final TextStyle textStyle = TextStyle(
    fontSize: 60,
    color: Colors.amberAccent[100],
  );
}