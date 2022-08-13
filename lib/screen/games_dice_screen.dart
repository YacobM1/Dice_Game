import 'dart:math';

import 'package:flutter/material.dart';

class GamesDiceScreen extends StatefulWidget {
  const GamesDiceScreen({Key? key}) : super(key: key);

  @override
  State<GamesDiceScreen> createState() => _GamesDiceScreenState();
}

class _GamesDiceScreenState extends State<GamesDiceScreen> {
  List<Image> myDice = [];

  String? playersFirstDice;
  String? playersSecondDice;

  int playerScore = 0;

  //Contains path and value
  final Map<String, int> deckOfDice = {
    "dice/dice1.png": 1,
    "dice/dice2.png": 2,
    "dice/dice3.png": 3,
    "dice/dice4.png": 4,
    "dice/dice5.png": 5,
    "dice/dice6.png": 6,
  };

  Map<String, int> playingDice = {};

  @override
  void initState() {
    super.initState();
    playingDice.addAll(deckOfDice);

  }

  void changeDice() {
    setState(() {});
    myDice = [];

    Random random = Random();

    String diceOneKey =
        playingDice.keys.elementAt(random.nextInt(playingDice.length));
    String diceTwoKey =
        playingDice.keys.elementAt(random.nextInt(playingDice.length));

    myDice.add(Image.asset(diceOneKey));
    myDice.add(Image.asset(diceTwoKey));

    playerScore = deckOfDice[diceOneKey]! + deckOfDice[diceTwoKey]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Players Dice
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  "Player score $playerScore",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: 250,
                height: 200,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: myDice.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: myDice[index],
                      );
                    }),
              ),
              Column(
                children: [
                  MaterialButton(
                    child: const Text(
                      "Roll",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black)),
                    onPressed: () {
                      changeDice();
                    },
                  ),
                   BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.videogame_asset_outlined),
                        label: 'Business',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.school),
                        label: 'School',
                      ),
                    ],
                    // selectedItemColor: Colors.amber[800],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
