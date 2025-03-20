import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _HomePageState();
}

class _HomePageState extends State<Dice> {
  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 72, 72),
      appBar: AppBar(
        title: Text('Dice App'),
        backgroundColor: const Color.fromARGB(255, 73, 135, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Text('Click To Roll', style: TextStyle(fontSize: 24)),
          Text('Sum is ${dice1 + dice2}', style: TextStyle(fontSize: 20)),
          Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/dice$dice1.png', width: 100, height: 100),
              Image.asset('images/dice$dice2.png', width: 100, height: 100),
            ],
          ),
          Spacer(flex: 2),
          ElevatedButton(
            onPressed: rollDice,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              backgroundColor: Colors.white,
            ),
            child: Text('Roll', style: TextStyle(fontSize: 18)),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
