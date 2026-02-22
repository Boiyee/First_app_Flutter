import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/* 
void main() {
  runApp(MyApp());
}
 */

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 9},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Lion', 'score': 4},
        {'text': 'Elephant', 'score': 6},
      ],
    },
    {
      'questionText': 'Who\'s your favorite character?',
      'answers': [
        {'text': 'Naruto', 'score': 10},
        {'text': 'Eren', 'score': 10},
        {'text': 'Ayanakoji', 'score': 10},
        {'text': 'Yagami', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App'), shadowColor: Colors.grey),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
