import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restartQuiz;
  Result(this.totalScore, this.restartQuiz);

  String get resultPhrase{
    var resultText = 'You did it';
    if(totalScore <= 10){

    } else if(totalScore <=20){
      resultText = 'less than 20 points';
    } else if(totalScore <= 30){
      resultText = '30 points wow';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: restartQuiz, child: Text('Restart Quiz'), textColor: Colors.blue,)
        ],
      ),
    );
  }
}
