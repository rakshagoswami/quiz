import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/qustions.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank=[
      Question.name("Idina Menzel sings 'let it go' 20 times in 'Let It Go' from Frozen" , false),
      Question.name("Waterloo has the greatest number of tube platforms in London", true),
      Question.name("A lion's roar can be heard up to eight kilometres away", true),
      Question.name("In Harry Potter, Draco Malfoy has no siblings", false),
      Question.name("'A' is the most common letter used in the English language", false),
      Question.name("There are two parts of the body that can't heal themselves", false),
      Question.name("The unicorn is the national animal of Scotland", true),
      Question.name("A lion's roar can be heard up to eight kilometres away", true),
      Question.name("There are five different blood groups", false),
      Question.name("A cara cara navel is a type of orange", true),
      Question.name("Madonna's real name is Madonna", true),
      Question.name("'What Do You Mean' was Justin Bieber's first UK number one single", true),
      Question.name("Ariana Grande is 25 or under", false),
      Question.name("ASOS stands for As Seen On Screen", true),
      Question.name("Alexander Fleming discovered penicillin", true),
      Question.name("Canis lupur is the scientific name for a wolf",false),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
      backgroundColor: Colors.white,

      //We use [Builder] here to use [context] that is a descendent of[Scaffold]
      //or else[Scaffold.of]  will return null
      body: Builder(
        builder:(BuildContext context) =>  Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("Images/flag1.png" ,
                        width: 300,
                          height: 200),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                          borderRadius: BorderRadius.circular(14.4),
                        border: Border.all(
                          color: Colors.blueGrey,
                          style: BorderStyle.solid
                        )
                      ),
                      height: 120,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                questionBank[_currentQuestionIndex].questionText,
                              style: TextStyle(
                              fontSize:16.9,
                              color: Colors.black
                            ),
                            ),
                          )
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(onPressed: () => _prevQuestion(),
                        color: Colors.blueGrey.shade700,
                        child: Icon(Icons.arrow_back,
                          color: Colors.white,),
                      ),
                       RaisedButton(onPressed: () => _checkAnswer(true,context),
                         color: Colors.blueGrey.shade700,
                         child: Text("True",
                              style: TextStyle(
                             color: Colors.white
                         ),
                         ),
                       ),
                      RaisedButton(onPressed: () => _checkAnswer(false,context),
                        color: Colors.blueGrey.shade700,
                        child: Text("False",
                          style: TextStyle(
                              color: Colors.white),
                        ),
                      ),
                      RaisedButton(onPressed: () => _nextQuestion(),
                        color: Colors.blueGrey.shade700,
                        child: Icon(Icons.arrow_forward,
                          color: Colors.white,),
                      ),
                   ],
                   ),
                   Spacer(),
                 ],
             ),
        ),
      ),
    );
  }
  _checkAnswer(bool userChoice , BuildContext context ) {
    if(userChoice ==  questionBank[_currentQuestionIndex].isCorrect){

      final snackbar = SnackBar(
        backgroundColor:  Colors.blue,
          duration:  Duration(milliseconds: 500),
          content: Text("Correct"));
      Scaffold.of(context).showSnackBar(snackbar);

      setState(() {
        _currentQuestionIndex++;
      });
      //correct answer
      debugPrint("Yes Correct");
            } else
              {
      debugPrint("Wrong Answer");
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration:  Duration(milliseconds: 500),
          content: Text("Incorrect...!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
  }
//
//    _updateQuestion(){
//      setState(() {
//        _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
//      });
//    }
    }
  _nextQuestion() {
    _updateQuestion();

  }

  void _updateQuestion() {
    setState(() {
        _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}


