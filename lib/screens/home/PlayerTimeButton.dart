import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chess_clock/screens/home/bloc/PlayerTimeBloc.dart';


class PlayerTimeButton extends StatelessWidget {
  final int time;
  final PlayersState player;
  final bool buttonEnabled;

  PlayerTimeButton({this.time, this.player, this.buttonEnabled});

  @override
  Widget build(BuildContext context) {
    final PlayersTimeBloc playersTimeBloc = BlocProvider.of<PlayersTimeBloc>(context);
    final String minutesStr = ((time / 60) % 60).floor().toString().padLeft(2, '0');
    final String secondsStr = (time % 60).floor().toString().padLeft(2, '0');
    print('$buttonEnabled $player');
    return Material(
      child: FlatButton(
        onPressed: buttonEnabled ? () => playersTimeBloc.add(player) : null,
        child: Text('$minutesStr:$secondsStr', style: textStyle),
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