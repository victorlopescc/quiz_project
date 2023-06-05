import 'package:flutter/material.dart';

main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  final selectedQuestion = 0;

  void answer() {

  }
 
  @override
  Widget build(BuildContext context) {
    final questions = [
      'Qual é o sistema operacional baseado em Linux mais popular?',
      'Qual é o comando usado para listar arquivos e diretórios no Linux?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Column(
          children: [
            Text(questions[selectedQuestion]),
            ElevatedButton(
               onPressed: answer,
               child: const Text('Resposta 1'),
            ),
            ElevatedButton(
               onPressed: answer,
               child: const Text('Resposta 2'),
            ),
            ElevatedButton(
               onPressed: answer,
               child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
