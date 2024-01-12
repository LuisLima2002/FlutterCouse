import 'package:adv_basic/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basic/models/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, this.switchScreen, {super.key});

  final void Function(String answer) onSelectAnswer;
  final void Function(int index) switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void onAnswerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    if (currentQuestionIndex >= questions.length - 1) {
      widget.switchScreen(2);
      return;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];

    return Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // mainAxisSize: MainAxisSize.min
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(152, 237, 223, 252),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestions
                .getShuffledAnswers()
                .map((answer) => AnswerButton(answer, () {
                      onAnswerQuestion(answer);
                    }))
          ],
        ));
  }
}
