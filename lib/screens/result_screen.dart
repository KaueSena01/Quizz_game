import 'package:flutter/material.dart';
import 'package:quizz_game/screens/quizz/quizz.dart';
import 'package:quizz_game/style/style.dart' as StyleApp;

import '../main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, { Key? key }) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
} 

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: StyleApp.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Congratulations", 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 38.0, 
              fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(
            height: 20.0,
          ),

          Text("Your score is:", 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 28.0, 
              fontWeight: FontWeight.w400,
          ),
          ),

          SizedBox(height: 50.0),
          Text("${widget.score}", style: TextStyle(
            color: Colors.orange, 
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
              )
            ),

          SizedBox(height: 60.0),
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzScreen()));
          },
          elevation: 0.0,
            padding: EdgeInsets.symmetric(vertical: 34.0, horizontal: 50.0),
            color: Colors.orange,
            textColor: Colors.white,
            child: Text("Repeat the Quizz"),
            )

          ],
        ),
      )
    );
  }
}