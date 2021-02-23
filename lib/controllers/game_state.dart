import 'package:get/get.dart';
import 'package:jogodogalo/controllers/game_controller.dart';

class GameState {
  List table;
  String peace;

  GameState({this.table, this.peace});

  //Control if there is a winner in the game
  //If there is, so stop game and alert user
  isWin() {
    if ((table[0] == peace && table[1] == peace && table[2] == peace) ||
        (table[3] == peace && table[4] == peace && table[5] == peace) ||
        (table[6] == peace && table[7] == peace && table[8] == peace) ||
        (table[0] == peace && table[3] == peace && table[6] == peace) ||
        (table[1] == peace && table[4] == peace && table[7] == peace) ||
        (table[2] == peace && table[5] == peace && table[8] == peace) ||
        (table[0] == peace && table[4] == peace && table[8] == peace) ||
        (table[2] == peace && table[4] == peace && table[6] == peace)) {
      return true;
    } else if (empate()) {
      Get.find<GameController>().empate = true;

      Get.find<GameController>().msg = 'Empate';
      Get.find<GameController>().update();
      return true;
    } else {
      return false;
    }
  }

  empate() {
    //Retorne an array if all elements diferent from X and O
    //If there isn't, it mean if empate
    final res = table.where((s) => s != "O" && s != "X").toList();
    return res.length == 0 ? true : false;
  }
}
