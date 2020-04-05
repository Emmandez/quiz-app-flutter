//package imports
import 'package:flutter/material.dart';
//Local Imports
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': "What's your favorite colors?",
      'answers': [
        {'text': 'Red', 'score':10}, 
        {'text': 'Blue', 'score':1}, 
        {'text': 'Green', 'score':5}, 
        {'text': 'Red', 'score':7}, 
      ]
    },
    {
      'questionText': "What is your favorite animal?",
      'answers': [
        {'text': 'Dog', 'score':1}, 
        {'text': 'Cat', 'score':1}, 
        {'text': 'Hamster', 'score':7}, 
        {'text': 'Ferret', 'score':10}, 
      ]
    },
    {
      'questionText': "Who is your favorite instructor?",
      'answers': [
        {'text': 'Max', 'score':10}, 
        {'text': 'Max', 'score':9}, 
        {'text': 'Max', 'score':1}, 
        {'text': 'Max', 'score':0}, 
      ]
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });

      _totalScore+=score;

      print("questionIndex " + _questionIndex.toString());
      print("total score" + _totalScore.toString());
    }
  }

  void _restartQuiz(){
    setState(() {
      _questionIndex = 0;
    });
  }

  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
          questions: _questions, 
          answerQuestion: _answerQuestion, 
          questionIndex: _questionIndex,
        ) 
        : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
