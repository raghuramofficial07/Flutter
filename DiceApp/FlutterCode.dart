import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(backgroundColor: Colors.red, body: DiceApp()),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  @override
  State<DiceApp> createState() {
    return _DiceAppState();
  }
}

class _DiceAppState extends State<DiceApp> {
  int diceNumber = 1; // Start with dice-1.png

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1; // Random number from 1 to 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/dice-$diceNumber.png', width: 200),
          SizedBox(height: 20),
          ElevatedButton(onPressed: rollDice, child: Text('Roll Dice')),
        ],
      ),
    );
  }
}
