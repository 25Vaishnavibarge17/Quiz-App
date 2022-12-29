import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/*import './question.dart';
import './answer.dart';*/
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Process of inserting an element in stack is called?',
      'answers': [
        {'text': 'Create', 'score': 0},
        {'text': 'Push', 'score': 1},
        {'text': 'Evaluation', 'score': 0},
        {'text': 'Pop', 'score': 0},
      ],
    },
    {
      'questionText':
          'In a stack, if a user tries to remove an element from an empty stack it is called? ',
      'answers': [
        {'text': 'Underflow', 'score': 1},
        {'text': ' Empty collection', 'score': 0},
        {'text': 'Overflow', 'score': 0},
        {'text': 'Garbage collection', 'score': 0},
      ],
    },
    {
      'questionText': 'A queue follows _____ principle',
      'answers': [
        {'text': 'LIFO', 'score': 0},
        {'text': 'FIFO', 'score': 1},
        {'text': 'Linear Tree', 'score': 0},
        {'text': 'Ordered Array', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which data structure do we use for testing a palindrome ?',
      'answers': [
        {'text': 'Tree', 'score': 0},
        {'text': 'Heap', 'score': 0},
        {'text': 'Priority Queue', 'score': 0},
        {'text': 'Stack', 'score': 1},
      ],
    },
    {
      'questionText': 'The time complexity of quicksort is ?',
      'answers': [
        {'text': 'O(n)', 'score': 0},
        {'text': 'O(logn)', 'score': 0},
        {'text': 'O(n^2)', 'score': 0},
        {'text': 'O(n logn)', 'score': 1},
      ],
    },
    {
      'questionText':
          'To represent hierarchical relationship between elements, which data structure is suitable ?',
      'answers': [
        {'text': 'Dequeue', 'score': 0},
        {'text': 'Tree', 'score': 1},
        {'text': 'Priority Queue', 'score': 0},
        {'text': 'Graph', 'score': 0},
      ],
    },
    {
      'questionText':
          'What function is used to append a character at the back of a string in C++ ?',
      'answers': [
        {'text': 'push()', 'score': 0},
        {'text': 'append()', 'score': 0},
        {'text': 'push_back()', 'score': 2},
        {'text': 'insert()', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which of the following data structures allow insertion and deletion from both ends ?',
      'answers': [
        {'text': 'Dequeue', 'score': 2},
        {'text': 'Tree', 'score': 0},
        {'text': 'Stack', 'score': 0},
        {'text': 'Strings', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalscore = 0;
  }

  void _answerQuestions(int score) {
    //var aBool=true;

    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (kDebugMode) {
      print(_questionIndex);
    }
    if (_questionIndex < _questions.length) {
      if (kDebugMode) {
        print('We have more questions!');
      }
    } else {
      if (kDebugMode) {
        print('No more questions!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: 'assets/splash.png',
        nextScreen: Scaffold(
          appBar: AppBar(
            title: const Text('Simple DSA Quiz'),
            backgroundColor: Colors.cyan,
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestions: _answerQuestions,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //
              : Result(_totalscore, _resetQuiz),
        ),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
