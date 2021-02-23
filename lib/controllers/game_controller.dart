import 'package:get/get.dart';
import 'package:jogodogalo/controllers/game_state.dart';
import 'package:jogodogalo/game_mode/ia_mode.dart';
import 'package:jogodogalo/models/player_model.dart';

class GameController extends GetxController {
  int gameMode;
  String msg;
  int currentPlayer = 0;
  bool endGame = false;
  bool empate = false;
  List<PlayerModel> players;
  List table;

  GameController(int gameMode) {
    this.gameMode = gameMode;
    table = createTable();
  }

  play(int pos) {
    PlayerModel player = players[currentPlayer];
    String peace = player.peace;
    if (gameMode == 1) //Mode normal
      addMove(pos, peace);
    else {
      //Playing with a computer
      //Human's time
      bool played = addMove(pos, peace);

      //PC's time
      if (played) {
        pos = IA().iaMove(table, 'O')['index'];
        addMove(pos, 'O');
      }
    }
  }

  addMove(pos, peace) {
    if (endGame) {
      return false;
    } else {
      if (!table[pos].toString().contains(RegExp("X|O"))) {
        table[pos] = peace;

        bool state = GameState(
          table: table,
          peace: peace,
        ).isWin();

        if (state) {
          endGame = true;

          if (!empate) {
            updateScore(peace);
            msg = "$peace venceu";
          }
        } else {
          nextPlayer();
          msg = players[currentPlayer].peace;
        }

        update();
        return true;
      } else
        return false;
    }
  }

  //Restart game, cleaning only the table
  resetGame() {
    table = createTable();
    endGame = false;
    empate = false;
    currentPlayer = 0;
    msg = '';
    update();
  }

  //Update player's score
  updateScore(peace) {
    players[currentPlayer].win();
    update();
  }

  nextPlayer() => currentPlayer < 1 ? currentPlayer++ : currentPlayer--;

  //CREATE TABLE's GAME
  List createTable() => [0, 1, 2, 3, 4, 5, 6, 7, 8];
}
