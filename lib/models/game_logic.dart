import 'dart:math';

class Player {
  static const x = 'x';
  static const o = 'o';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(int a, int b, [int? c]) {
    if (c == null) {
      return contains(a) && contains(b);
    } else {
      return contains(a) && contains(b) && contains(c);
    }
  }
}

class Game {
  static String winner = '';
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  List emptyCells() {
    List allEmptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        allEmptyCells.add(i);
      }
    }
    return allEmptyCells;
  }

  List filledcells() {
    List filledCells = [];
    for (int i = 0; i < 9; i++) {
      if (Player.playerX.contains(i) || Player.playerO.contains(i)) {
        filledCells.add(i);
      }
    }
    return filledCells;
  }

  checkWinner() {
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
  }

  autoPlay(String activePlayer) {
    // ignore: unused_local_variable
    int index = 0;
    List<int> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    // {0,1,2
    //  3,4,5
    //  6,7,8}
// attack

    if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(1, 2) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(3, 4) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(4, 5) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(6, 7) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(7, 8) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(3, 5) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(6, 8) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(0, 3) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(1, 4) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(2, 5) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(6, 3) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(7, 4) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(8, 5) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(6, 0) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(7, 1) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(8, 2) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(0, 4) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(2, 4) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(6, 4) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(8, 4) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(2, 6) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(8, 0) && emptyCells.contains(4)) {
      index = 4;
    }

// Defense
    else if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(1, 2) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(4, 5) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(7, 8) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(3, 5) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(6, 3) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(8, 5) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(6, 0) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(7, 1) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(8, 2) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(6, 4) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(8, 4) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(8, 0) && emptyCells.contains(4)) {
      index = 4;
    } else {
      Random random = Random();
      int randomIndex = random.nextInt(emptyCells.length);
      index = emptyCells[randomIndex];
    }
    playGame(index, activePlayer);
  }
}
