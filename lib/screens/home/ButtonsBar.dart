import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chess_clock/screens/home/bloc/PlayerTimeBloc.dart';

class ButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlayersTimeBloc playersTimeBloc = BlocProvider.of<PlayersTimeBloc>(context);

    return ButtonBar(
      children: <Widget>[
        IconButton(icon: Icon(Icons.restore, color: Colors.purple[900]), onPressed: () => resetButton(playersTimeBloc)),
        IconButton(icon: Icon(Icons.pause, color: Colors.purple[900]), onPressed: () => pauseButton(playersTimeBloc)),
        IconButton(icon: Icon(Icons.settings, color: Colors.purple[900]), onPressed: () => settingButton()),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }

  void resetButton(PlayersTimeBloc playersTimeBloc){
    playersTimeBloc.add(PlayersState.BeforeStart);
  }

  void pauseButton(PlayersTimeBloc playersTimeBloc){
    playersTimeBloc.add(PlayersState.Pause);
  }

  void settingButton(){
    print("Settings clicked");
  }
}