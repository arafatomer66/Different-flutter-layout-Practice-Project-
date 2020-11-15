import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz/quiz.dart';
import 'quiz/result.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 12.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Mobile',
      amount: 112.99,
      date: DateTime.now(),
    ),
  ];

  String title;

  String amount;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Container(
//                  width: 150,
                  child: Text('Chart'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title '),
                      controller: titleController,
                    ),
                    TextField(
                        decoration: InputDecoration(labelText: 'Amount '),
                        controller: amountController),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                        print(titleController);
                        print(amountController);
                      },
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Text(
//                          tx.amount.toString(),
                          '\$${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd').format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
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
