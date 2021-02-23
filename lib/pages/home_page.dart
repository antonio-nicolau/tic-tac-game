import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jogodogalo/widgets/alerts/choose_player_vs_pc.dart';
import 'package:jogodogalo/widgets/alerts/choose_players_alert.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da velha'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                button('Jogo normal', Colors.green,
                    () => Get.dialog(choosePlayersAlert())),
                SizedBox(height: 15.0),
                button('Jogar contra PC', Colors.red,
                    () => Get.dialog(choosePlayerVsPC()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  button(label, color, Function f) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RaisedButton(
        onPressed: () => f(),
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          '$label',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
