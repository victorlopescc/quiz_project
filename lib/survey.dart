import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Survey extends StatelessWidget {
  const Survey({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
  });

  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['answers'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Question(text: questions[selectedQuestion]['text'].toString()),
        ...answers
            .map((resp) => Answer(
                text: resp['text'] as String,
                onPressed: () => answer(int.parse(resp['value'].toString()))))
            .toList(),
      ],
    );
  }
}
