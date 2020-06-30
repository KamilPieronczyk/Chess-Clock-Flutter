import 'package:chess_clock/screens/home/ButtonsBar.dart';
import 'package:chess_clock/screens/home/PlayerTimeButton.dart';
import 'package:flutter/material.dart';

class PlayerTimes {
    int player1;
    int player2;
    PlayerTimes({this.player1, this.player2});
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  child: PlayerTimeButton(),
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0)
                )
              ),
              Expanded(
                flex: 0,
                child: ButtonsBar(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  child: PlayerTimeButton(),
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 25)
                )
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        )
      ),
      backgroundColor: Colors.purpleAccent[700],
    );
  }
}
