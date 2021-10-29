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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Turn On/Off two player',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              value: isSwitched,
              onChanged: (val) {
                setState(() {
                  isSwitched = val;
                  gameOver = val;
                });
              },
            ),
            Text(
              'it\'s $activePlayer turn'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 52,
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Expanded(
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
                          onTap: gameOver
                              ? null
                              : () {
                                  myFun(index);
                                },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const Center(
                              child: Text(
                                'x',
                                style: TextStyle(fontSize: 45),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: FloatingActionButton.extended(
          onPressed: () {
            turns = 0;
            gameOver = false;
            activePlayer = 'X';
            game = Game();
            result = '';
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

  void myFun(int index) {
    game.playGame(index, activePlayer);
  }
}
