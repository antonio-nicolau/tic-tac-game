import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jogodogalo/controllers/game_controller.dart';
import 'package:jogodogalo/models/player_model.dart';
import 'package:jogodogalo/widgets/player_names_widget.dart';
import 'package:jogodogalo/widgets/table_widget.dart';

class GamePage extends StatefulWidget {
  int gameMode;
  List<PlayerModel> players;

  GamePage({@required this.players, @required this.gameMode});
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameController _controller;
  @override
  void initState() {
    _controller = GameController(widget.gameMode);
    //Register players added before
    _controller.players = widget.players;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da velha'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Reiniciar',
            onPressed: () => _controller.resetGame(),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<GameController>(
            initState: (_) {},
            init: _controller,
            builder: (_) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    playerNamesWidget(context, _controller.players),
                    SizedBox(height: 15),
                    tableWidget(context, _controller),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
