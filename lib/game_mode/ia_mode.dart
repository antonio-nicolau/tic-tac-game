class IA {
  String iaPeace = 'O';
  String humanPeace = 'X';

  emptyHouses(table) {
    return table.where((s) => s != "O" && s != "X").toList();
  }

  winning(table, player) {
    if ((table[0] == player && table[1] == player && table[2] == player) ||
        (table[3] == player && table[4] == player && table[5] == player) ||
        (table[6] == player && table[7] == player && table[8] == player) ||
        (table[0] == player && table[3] == player && table[6] == player) ||
        (table[1] == player && table[4] == player && table[7] == player) ||
        (table[2] == player && table[5] == player && table[8] == player) ||
        (table[0] == player && table[4] == player && table[8] == player) ||
        (table[2] == player && table[4] == player && table[6] == player)) {
      return true;
    } else {
      return false;
    }
  }

  //To implement IA's mode I used Minimax algorithm
  iaMove(table, peace) {
    final availSpots = emptyHouses(table);

    if (winning(table, humanPeace)) {
      return {'score': -10};
    } else if (winning(table, iaPeace)) {
      return {'score': 10};
    } else if (availSpots.length == 0) {
      return {'score': 0};
    }

    // an array to collect all the moves
    List moves = [];

    // loop through available spots
    for (int i = 0; i < availSpots.length; i++) {
      //create an object for store the index of that spot
      Map move = Map();
      move['index'] = table[availSpots[i]];

      // set the empty spot to the current player
      table[availSpots[i]] = peace;

      /*collect the score resulted from calling minimax 
      on the opponent of the current player
      */
      if (peace == iaPeace) {
        final result = iaMove(table, humanPeace);
        move['score'] = result['score'];
      } else {
        final result = iaMove(table, iaPeace);
        move['score'] = result['score'];
      }

      // reset the spot to empty
      table[availSpots[i]] = move['index'];
      // push the object to the array
      moves.add(move);
    }

    //analise the best score
    // if it is the computer's turn loop over the moves and choose the move with the highest score
    int bestMove;
    if (peace == iaPeace) {
      int bestScore = -10000;
      for (int i = 0; i < moves.length; i++) {
        if (moves[i]['score'] > bestScore) {
          bestScore = moves[i]['score'];
          bestMove = i;
        }
      }
    } else {
      // else loop over the moves and choose the move with the lowest score
      int bestScore = 10000;
      for (int i = 0; i < moves.length; i++) {
        if (moves[i]['score'] < bestScore) {
          bestScore = moves[i]['score'];
          bestMove = i;
        }
      }
    }

    //return the chosen move from the moves array
    return moves[bestMove];
  }
}
