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

  final _questions = const [
    {
      'text': 'Which is the most popular Linux-based operating system?',
      'answers': ['Ubuntu', 'Windows', 'macOS', 'Android'],
    },
    {
      'text':
          'What is the command used to list files and directories in Linux?',
      'answers': ['dir', 'ls', 'list', 'show'],
    },
    {
      'text': 'What is the default shell configuration file in Linux?',
      'answers': ['.bashrc', '.profile', '.bash_profile', '.config'],
    },
    {
      'text': 'What is the command used to copy a file in Linux?',
      'answers': ['copy', 'mv', 'cp', 'move'],
    },
    {
      'text': 'What is the command used to remove a directory in Linux?',
      'answers': ['rmdir', 'rd', 'rm', 'del'],
    },
    {
      'text':
          'What is the command used to change permissions of a file in Linux?',
      'answers': ['chmod', 'chown', 'chgrp', 'perm'],
    },
    {
      'text': 'What is the default home directory for a user in Linux?',
      'answers': ['/root', '/home', '/usr', '/bin'],
    },
    {
      'text': 'What is the command used to shut down the system in Linux?',
      'answers': ['shutdown', 'halt', 'poweroff', 'all of the above'],
    },
    {
      'text': 'What is the command used to check disk space in Linux?',
      'answers': ['df', 'du', 'space', 'disk'],
    },
    {
      'text':
          'What is the default display server used in most Linux distributions?',
      'answers': ['GNOME', 'KDE', 'X.Org', 'Wayland'],
    },
  ];

  void _answer() {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
      });
    }
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
          title: const Text('Quiz'),
        ),
        body: hasSelectedQuestion
            ? Survey(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                answer: _answer,
              )
            : const Result(),
      ),
    );
  }
}
