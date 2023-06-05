import 'package:flutter/material.dart';
import './survey.dart';
import './result.dart';

main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;

  final _questions = const [
    {
      'text': 'Which is the most popular Linux-based operating system?',
      'answers': [
        {'text': 'Ubuntu', 'value': 1},
        {'text': 'Windows', 'value': 0},
        {'text': 'macOS', 'value': 0},
        {'text': 'Android', 'value': 0}
      ],
    },
    {
      'text':
          'What is the command used to list files and directories in Linux?',
      'answers': [
        {'text': 'dir', 'value': 0},
        {'text': 'ls', 'value': 1},
        {'text': 'list', 'value': 0},
        {'text': 'show', 'value': 0}
      ],
    },
    {
      'text': 'What is the default shell configuration file in Linux?',
      'answers': [
        {'text': '.bashrc', 'value': 1},
        {'text': '.profile', 'value': 0},
        {'text': '.bash_profile', 'value': 0},
        {'text': '.config', 'value': 0}
      ],
    },
    {
      'text': 'What is the command used to copy a file in Linux?',
      'answers': [
        {'text': 'copy', 'value': 0},
        {'text': 'mv', 'value': 0},
        {'text': 'cp', 'value': 1},
        {'text': 'move', 'value': 0}
      ],
    },
    {
      'text': 'What is the command used to remove a directory in Linux?',
      'answers': [
        {'text': 'rmdir', 'value': 0},
        {'text': 'rd', 'value': 0},
        {'text': 'rm', 'value': 1},
        {'text': 'del', 'value': 0}
      ],
    },
    {
      'text':
          'What is the command used to change permissions of a file in Linux?',
      'answers': [
        {'text': 'chmod', 'value': 1},
        {'text': 'chown', 'value': 0},
        {'text': 'chgrp', 'value': 0},
        {'text': 'perm', 'value': 0}
      ],
    },
    {
      'text': 'What is the default home directory for a user in Linux?',
      'answers': [
        {'text': '/root', 'value': 0},
        {'text': '/home', 'value': 1},
        {'text': '/usr', 'value': 0},
        {'text': '/bin', 'value': 0}
      ],
    },
    {
      'text': 'What is the command used to shut down the system in Linux?',
      'answers': [
        {'text': 'shutdown', 'value': 0},
        {'text': 'halt', 'value': 0},
        {'text': 'poweroff', 'value': 0},
        {'text': 'all of the above', 'value': 1}
      ],
    },
    {
      'text': 'What is the command used to check disk space in Linux?',
      'answers': [
        {'text': 'df', 'value': 1},
        {'text': 'du', 'value': 0},
        {'text': 'space', 'value': 0},
        {'text': 'disk', 'value': 0}
      ],
    },
    {
      'text':
          'What is the default display server used in most Linux distributions?',
      'answers': [
        {'text': 'GNOME', 'value': 0},
        {'text': 'KDE', 'value': 0},
        {'text': 'X.Org', 'value': 1},
        {'text': 'Wayland', 'value': 0}
      ],
    },
  ];

  void _answer(int points) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalPoints += points;
      });
    }
  }

  void _restartQuestions() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Linux Quiz'),
        ),
        body: hasSelectedQuestion
            ? Survey(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                answer: _answer,
              )
            : Result(points: _totalPoints, restartQuestions: _restartQuestions),
      ),
    );
  }
}
