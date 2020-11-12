import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  String get message {
    return 'You did it';
  }

  Result(this.resultScore, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20),
          ),
          FlatButton(
            child: Text('Reset the quiz'),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
