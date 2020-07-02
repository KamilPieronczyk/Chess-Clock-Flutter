import 'package:bloc/bloc.dart';
import 'dart:async';

//State
class PlayersTime {
  int player1;
  int player2;

  bool player1ButtonEnabled = true;
  bool player2ButtonEnabled = true;

  PlayersTime({this.player1, this.player2});

  void decrementPlayer1() {
    player1 = player1 > 0 ? player1-1 : player1;
    print(player1);
  }

  void decrementPlayer2() {
    player2 = player2 > 0 ? player2-1 : player2;
  }

  PlayersTime.init(int x, int y) : player1 = x, player2 = y;

  PlayersTime.of(PlayersTime value) :
    player1 = value.player1,
    player2 = value.player2,
    player1ButtonEnabled = value.player1ButtonEnabled,
    player2ButtonEnabled = value.player2ButtonEnabled
}

//Events
enum PlayersState {BeforeStart, Player1, Player2, Finish, Pause}

//Bloc
class PlayersTimeBloc extends Bloc<PlayersState, PlayersTime> {
  @override
  PlayersTime get initialState => PlayersTime.init(60*5, 60*5);

  var oneSec = const Duration(seconds:1);

  PlayersState newEvent;

  @override
  Stream<PlayersTime> mapEventToState(PlayersState event) async*{
    newEvent = event;
    switch(event){
      case PlayersState.Player1:
        Timer(oneSec, () {
          if(newEvent == event){
            state.decrementPlayer1();
            this.add(PlayersState.Player1);
          }
        });
        state.player1ButtonEnabled = true;
        state.player2ButtonEnabled = false;
        yield PlayersTime.of(state);
        break;
      case PlayersState.Player2:
        Timer(oneSec, () {
          if(newEvent == event){
            state.decrementPlayer2();
            this.add(PlayersState.Player2);
          }
        });
        state.player1ButtonEnabled = false;
        state.player2ButtonEnabled = true;
        yield PlayersTime.of(state);
        break;
      case PlayersState.BeforeStart:
        yield PlayersTime.init(5*60, 5*60);
        break;
      default:
        yield state;
        break;
    }
  }
}