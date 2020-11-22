import 'dart:async';

import 'Onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              )),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => onboarding()));
  }
}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:learn_flutter_basic/expense_tracker/new_transaction.dart';
//import 'package:learn_flutter_basic/expense_tracker/transaction_list.dart';
//import 'package:learn_flutter_basic/expense_tracker/user_transaction.dart';
//import 'expense_tracker/chart.dart';
//import 'quiz/quiz.dart';
//import 'quiz/result.dart';
//import 'expense_tracker/model/transaction.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  String title;
//  String amount;
//  final List<Transaction> _userTransaction = [
//    Transaction(
//      id: 't1',
//      title: 'New Shoes',
//      amount: 12.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Mobile',
//      amount: 11.99,
//      date: DateTime.now(),
//    ),
//  ];
//
//  List<Transaction> get recentTransactions {
//    return _userTransaction.where((tx) {
//      return tx.date.isAfter(
//        DateTime.now().subtract(
//          Duration(days: 7),
//        ),
//      );
//    }).toList();
//  }
//
//  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
//    final newTx = Transaction(
//        title: title,
//        amount: amount,
//        date: chosenDate,
//        id: DateTime.now().toString());
//
//    setState(() {
//      _userTransaction.add(newTx);
//    });
//  }
//
//  void deleteTransaction(String id) {
//    setState(() {
//      _userTransaction.removeWhere((tx) {
//        return tx.id == id;
//      });
//    });
//  }
//
//  void _startAddNewTransaction(BuildContext ctx) {
//    showModalBottomSheet(
//      context: ctx,
//      builder: (_) {
//        return GestureDetector(
//          onTap: () {},
//          child: NewTransaction(_addNewTransaction),
//          behavior: HitTestBehavior.opaque,
//        );
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(primarySwatch: Colors.purple),
//      home: Home(_startAddNewTransaction, _userTransaction, recentTransactions,
//          deleteTransaction),
//    );
//  }
//}
//
//class Home extends StatelessWidget {
//  final Function _startAddNewTransaction;
//  final Function deleteTransaction;
//  final _userTransaction;
//  final List recentTransactions;
//
//  Home(this._startAddNewTransaction, this._userTransaction,
//      this.recentTransactions, this.deleteTransaction);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Expense Tracker'),
//        actions: [
//          IconButton(
//            icon: Icon(Icons.add),
//            onPressed: () => _startAddNewTransaction(context),
//          )
//        ],
//      ),
//      body: SingleChildScrollView(
//        child: Column(
////          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//            Chart(recentTransactions),
//            TransactionList(_userTransaction, deleteTransaction)
//          ],
//        ),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () => _startAddNewTransaction(context),
//      ),
//    );
//  }
//}

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
