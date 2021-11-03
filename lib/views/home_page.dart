import 'package:flutter/material.dart';
import 'package:tic_tac/models/game_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int turns = 0;
  bool gameOver = false;
  String activePlayer = 'X';
  Game game = Game();
  String result = '';

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  if (!isLandScape) ...firstBlock(),
                  if (!isLandScape) expandedWidget(context),
                  if (!isLandScape) ...lastBlock(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ...firstBlock(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 7),
                        ...lastBlock(),
                      ],
                    ),
                  ),
                  expandedWidget(context),
                ],
              ),
      ),
      floatingActionButtonLocation:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              Player.playerO = [];
              Player.playerX = [];
              turns = 0;
              gameOver = false;
              activePlayer = 'X';
              game = Game();
              result = '';
            });
          },
          label: const Text(
            'replay again',
            style: TextStyle(fontSize: 28),
          ),
          icon: const Icon(
            Icons.replay,
            size: 35,
          ),
          backgroundColor: Theme.of(context).splashColor,
        ),
      ),
    );
  }

  List<Widget> firstBlock() {
    return [
      SizedBox(height: MediaQuery.of(context).size.height / 40),
      SwitchListTile.adaptive(
        title: Text(
          MediaQuery.of(context).orientation == Orientation.portrait
              ? 'Turn On/Off two player'
              : 'Turn On/Off \n two player',
          textAlign: MediaQuery.of(context).orientation == Orientation.landscape
              ? TextAlign.center
              : TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        value: isSwitched,
        onChanged: (val) {
          setState(() {
            isSwitched = val;
            // gameOver = val;
          });
        },
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      Text(
        'it\'s $activePlayer turn'.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 52,
        ),
      ),
    ];
  }

  List<Widget> lastBlock() {
    return [
      Text(
        result,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height / 7)
    ];
  }

  Expanded expandedWidget(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        children: List.generate(
            9,
            (index) => InkWell(
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: gameOver || game.filledcells().contains(index)
                      ? null
                      : () {
                          myFun(index);
                          turns++;
                        },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        Player.playerX.contains(index)
                            ? 'x'
                            : Player.playerO.contains(index)
                                ? 'o'
                                : '',
                        style: TextStyle(
                            fontSize: 65,
                            color: Player.playerX.contains(index)
                                ? Colors.blue
                                : Colors.red),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  void myFun(int index) {
    if ((Player.playerO.isEmpty || !Player.playerO.contains(index)) &&
        (Player.playerX.isEmpty || !Player.playerX.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();
    }
    if (!isSwitched && !gameOver && turns < 4) {
      game.autoPlay(activePlayer);
      updateState();
    }
  }

  void updateState() {
    setState(() {
      activePlayer = activePlayer == 'X' ? 'O' : 'X';
    });
    game.checkWinner();
    if (Game.winner != '') {
      gameOver = true;
      result = '${Game.winner} is The Winner';
    } else {
      if (!isSwitched) {
        if (turns == 4) result = 'It\'s Tie';
      } else {
        if (turns == 8) result = 'It\'s Tie';
      }
    }
  }
}
