import 'package:adv_basic/models/question.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:adv_basic/results_screen.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];
  void onSelectAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  void switchScreen(int index) {
    setState(() {
      if (index == 0) {
        selectedAnswers.clear();
        activeScreen = StartScreen(switchScreen);
      } else if (index == 1) {
        activeScreen = QuestionScreen(onSelectAnswer, switchScreen);
      } else if (index == 2) {
        activeScreen = ResultScreen(
          switchScreen: switchScreen,
          selectedAnswers: selectedAnswers,
          correctAnswers: questions.map((e) => e.answers[0]).toList(),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent])),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
