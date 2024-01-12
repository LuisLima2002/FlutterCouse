import 'dart:math';

import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

final randomizer = Random();

class _DiceRollerState extends State<DiceRoller> {
  var currentDice = 1;
  void rollDice() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/dice-$currentDice.png", width: 250),
        const SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.grey),
            child: const StyledText("Roll Dice"))
      ],
    );
  }
}
