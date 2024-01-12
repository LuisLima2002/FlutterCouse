import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onPress, {super.key});
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
