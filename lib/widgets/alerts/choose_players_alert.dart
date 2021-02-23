import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jogodogalo/models/player_model.dart';
import 'package:jogodogalo/pages/game_page.dart';

choosePlayersAlert() {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  return AlertDialog(
      title: Text('Jogo normal'),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textField('Jogador 1', _firstController),
              SizedBox(height: 15.0),
              _textField('Jogador 2', _secondController),
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
          onPressed: () => startGame(_firstController, _secondController),
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

startGame(firstController, secondController) {
  String firstName = firstController.text;
  String secondName = secondController.text;

  firstName = validateName(firstName);
  secondName = validateName(secondName);

  List<PlayerModel> players = [
    PlayerModel(name: firstName, peace: 'X'),
    PlayerModel(name: secondName, peace: 'O'),
  ];

  Get.back();
  Get.to(GamePage(
    players: players,
    gameMode: 1,
  ));
}

validateName(String name) {
  return name.isNotEmpty ? name : 'Anônimo';
}
