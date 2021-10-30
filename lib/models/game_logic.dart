import 'dart:math';

class Player {
  static const x = 'x';
  static const o = 'o';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  checkWinner() {}
  autoPlay(String activePlayer) {
    // ignore: unused_local_variable
    int index = 0;
    List<int> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    Random random = Random();
    int randomIndex = random.nextInt(emptyCells.length);
    index = emptyCells[randomIndex];
    playGame(index, activePlayer);
  }
}
