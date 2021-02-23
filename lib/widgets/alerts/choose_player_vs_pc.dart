import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jogodogalo/models/player_model.dart';
import 'package:jogodogalo/pages/game_page.dart';

choosePlayerVsPC() {
  final _firstController = TextEditingController();

  return AlertDialog(
      title: Text('Vs PC'),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textField('Jogador 1', _firstController),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () => Get.back(),
          child: Text('Fechar'),
        ),
        FlatButton(
          onPressed: () => startGame(_firstController),
          child: Text('Jogar'),
        ),
      ]);
}

_textField(label, controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
    ),
    maxLength: 20,
    maxLines: 1,
  );
}

startGame(firstController) {
  String firstName = firstController.text;

  firstName = validateName(firstName);

  List<PlayerModel> players = [
    PlayerModel(name: firstName, peace: 'X'),
    PlayerModel(name: 'PC', peace: 'O'),
  ];

  Get.back();
  Get.to(GamePage(
    players: players,
    gameMode: 2,
  ));
}

validateName(String name) {
  return name.isNotEmpty ? name : 'Anônimo';
}
