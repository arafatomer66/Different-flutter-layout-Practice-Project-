import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz/quiz.dart';
import 'quiz/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            Card(
              child: Text('Lists'),
            )
          ],
        ),
      ),
    );
  }
}

//class MyApp extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _MyAppState();
//  }
//}
//
//class _MyAppState extends State<MyApp> {
//  int _questionIndex = 0;
//  int _totalScore = 0;
//
//  static const questions = [
//    {
//      'questionText': 'What\'s your favourite color',
//      'answer': [
//        {'text': 'red', 'score': 10},
//        {'text': 'black', 'score': 12},
//        {'text': 'white', 'score': 5},
//        {'text': 'green', 'score': 7},
//      ],
//    },
//    {
//      'questionText': 'What\'s your favourite animal',
//      'answer': [
//        {'text': 'dog', 'score': 10},
//        {'text': 'cat', 'score': 12},
//        {'text': 'pig', 'score': 5},
//        {'text': 'goat', 'score': 7},
//      ],
//    },
//    {
//      'questionText': 'What\'s your favourite food',
//      'answer': [
//        {'text': 'pizza', 'score': 10},
//        {'text': 'pasta', 'score': 12},
//        {'text': 'burger', 'score': 5},
//        {'text': 'chicken', 'score': 7},
//      ],
//    },
//  ];
//
//  void resetQuiz() {
//    setState(() {
//      _questionIndex = 0;
//      _totalScore = 0;
//    });
//  }
//
//  void _answerQuestions(score) {
//    _totalScore += score;
//    setState(() {
//      _questionIndex = _questionIndex + 1;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('This is my first App'),
//          ),
//          body: _questionIndex < questions.length
//              ? Quiz(
//                  answerQuestion: _answerQuestions,
//                  questions: questions,
//                  questionIndex: _questionIndex,
//                )
//              : Result(_totalScore , resetQuiz)),
//    );
//  }
//}
