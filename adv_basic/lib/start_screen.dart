import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function(int index) clickHandle;
  const StartScreen(this.clickHandle, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 250,
          color: const Color.fromRGBO(255, 255, 255, 0.75),
        ),
        const SizedBox(height: 50),
        const Text(
          "Learn Flutter the fun away!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: () {
            clickHandle(1);
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(15), foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            " Start Quiz",
            style: TextStyle(fontSize: 22),
          ),
        )
      ],
    );
  }
}
