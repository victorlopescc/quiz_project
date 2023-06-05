import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.points, required this.restartQuestions});

  final int points;
  final void Function() restartQuestions;

  String get resultText {
    if (points == 10) {
      return "You're almost like Alan Turing!";
    } else if (points >= 8) {
      return "Congrats!";
    } else if (points >= 5) {
      return "Half way there!";
    } else {
      return "Keep studying!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "$resultText $points/10",
            style: const TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: restartQuestions,
          child: const Text('Restart?'),
        )
      ],
    );
  }
}
