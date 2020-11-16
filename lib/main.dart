import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/expense_tracker/new_transaction.dart';
import 'package:learn_flutter_basic/expense_tracker/transaction_list.dart';
import 'package:learn_flutter_basic/expense_tracker/user_transaction.dart';
import 'quiz/quiz.dart';
import 'quiz/result.dart';
import 'expense_tracker/model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title;
  String amount;
  final List<Transaction> _userTransaction = [
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(_startAddNewTransaction, _userTransaction));
  }
}

class Home extends StatelessWidget {
  final Function _startAddNewTransaction;

  final _userTransaction;

  Home(this._startAddNewTransaction, this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
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
