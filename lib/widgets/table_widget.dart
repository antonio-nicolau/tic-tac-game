import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jogodogalo/controllers/game_controller.dart';

tableWidget(context, _controller) {
  String peace = _controller.players[_controller.currentPlayer].peace;
  String msg = _controller.msg;

  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columns(_controller, 0),
            verticalLine(),
            columns(_controller, 1),
            verticalLine(),
            columns(_controller, 2),
          ],
        ),
        horizontallLine(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columns(_controller, 3),
            verticalLine(),
            columns(_controller, 4),
            verticalLine(),
            columns(_controller, 5),
          ],
        ),
        horizontallLine(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columns(_controller, 6),
            verticalLine(),
            columns(_controller, 7),
            verticalLine(),
            columns(_controller, 8),
          ],
        ),
        userMessage(msg, peace),
      ],
    ),
  );
}

columns(GameController _controller, pos) {
  String value = _controller.table[pos].toString();
  value = value.contains(RegExp('X|O')) ? value : '';

  return GestureDetector(
    onTap: () => _controller.play(pos),
    child: Container(
      width: MediaQuery.of(Get.context).size.width * 0.3,
      height: 100,
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: 60.0,
          color: value == 'X' ? Colors.black : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

verticalLine() {
  return Container(
    height: 100,
    width: 4,
    color: Colors.black,
  );
}

horizontallLine(context) {
  return Container(
    height: 4,
    width: MediaQuery.of(context).size.width * 0.8,
    color: Colors.black,
  );
}

userMessage(msg, peace) {
  return Container(
    child: Text(
      '${msg != null ? msg : ''}',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: peace == 'X' ? Colors.black : Colors.green,
      ),
    ),
  );
}
