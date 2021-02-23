import 'package:flutter/material.dart';
import 'package:jogodogalo/models/player_model.dart';

playerNamesWidget(context, List<PlayerModel> players) {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        items(context, players[0]),
        SizedBox(width: 10.0),
        items(context, players[1]),
      ],
    ),
  );
}

items(context, PlayerModel player) {
  return Container(
    padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 30.0),
    width: MediaQuery.of(context).size.width * 0.3,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '${player.name}',
            style: TextStyle(
              fontSize: 19,
              color: player.peace == 'X' ? Colors.black : Colors.green,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          '${player.points}',
          style: TextStyle(
            fontSize: 20,
            color: player.peace == 'X' ? Colors.black : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
