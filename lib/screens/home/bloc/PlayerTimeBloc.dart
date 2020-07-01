import 'package:bloc/bloc.dart';

class PlayersTime {
  int player1;
  int player2;
  PlayersTime({this.player1, this.player2});

  void decrementPlayer1() {
    player1 = player1 > 0 ? player1-1 : player1;
    print(player1);
  }

  void decrementPlayer2() {
    player2 = player2 > 0 ? player2-1 : player2;
  }

  PlayersTime.init(int x, int y) : player1 = x, player2 = y;

  PlayersTime.of(PlayersTime value) : player1 = value.player1, player2 = value.player2;
}

enum PlayersState {BeforeStart, Player1, Player2, Finish}

class PlayersTimeBloc extends Bloc<PlayersState, PlayersTime> {
  @override
  PlayersTime get initialState => PlayersTime.init(60*5, 60*5);

  @override
  Stream<PlayersTime> mapEventToState(PlayersState event) async*{
    switch(event){
      case PlayersState.Player1:
        yield PlayersTime.of(state..decrementPlayer1());
        break;
      case PlayersState.Player2:
        yield PlayersTime.of(state..decrementPlayer2());
        break;
      default:
        yield state;
        break;
    }
  }
}