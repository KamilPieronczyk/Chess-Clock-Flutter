import 'package:chess_clock/screens/home/ButtonsBar.dart';
import 'package:chess_clock/screens/home/PlayerTimeButton.dart';
import 'package:chess_clock/screens/home/bloc/PlayerTimeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
                  child: BlocBuilder<PlayersTimeBloc, PlayersTime>(
                    builder: (context, snapshot) {
                      print(snapshot.player1);
                      return PlayerTimeButton(time: snapshot.player1, player: PlayersState.Player1);
                    }
                  ),
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
                  child: BlocBuilder<PlayersTimeBloc, PlayersTime>(
                    builder: (context, snapshot) {
                      print(snapshot.player1);
                      return PlayerTimeButton(time: snapshot.player2, player: PlayersState.Player2);
                    }
                  ),
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
