import 'package:adv_basic/models/question.dart';
import 'package:adv_basic/models/quiz_question.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.switchScreen,
      required this.selectedAnswers,
      required this.correctAnswers});

  final void Function(int index) switchScreen;

  final List<String> selectedAnswers;
  final List<String> correctAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < correctAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i],
        "selectedAnswer": selectedAnswers[i],
        "correctAnswer": correctAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfCorrect = 0;
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == correctAnswers[i]) {
        numberOfCorrect++;
      }
    }
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "You answer $numberOfCorrect out of ${correctAnswers.length} questions correctly",
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 240, 240, 240)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 400,
          width: 320,
          child: SingleChildScrollView(
              child: Column(
            children: getSummaryData()
                .map((e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              e["selectedAnswer"] == e["correctAnswer"]
                                  ? const Color.fromARGB(255, 81, 81, 241)
                                  : const Color.fromARGB(255, 241, 81, 81),
                          maxRadius: 15,
                          child: Text(
                            ((e["question_index"] as int) + 1).toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.deepPurple),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                (e["question"] as QuizQuestion).text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                e["selectedAnswer"] as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 184, 184, 184)),
                              ),
                              Text(
                                e["correctAnswer"] as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.blueAccent),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                .toList(),
          )),
        ),
        TextButton.icon(
          onPressed: () {
            switchScreen(0);
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            "Restart Quiz",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
