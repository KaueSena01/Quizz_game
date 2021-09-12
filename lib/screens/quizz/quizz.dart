import 'package:flutter/material.dart';
import 'package:quizz_game/data/questions_list.dart';
import 'package:quizz_game/screens/result_screen.dart';
import 'package:quizz_game/style/style.dart' as StyleApp;

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {

  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleApp.mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page){
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Question ${index + 1}/${questions.length}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 28.0,
                  ), 
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 20.0,),
                Text(questions[index].question!, 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  )
                ),
                SizedBox(
                  height: 35.0,
                ),

                for(int i = 0; i<questions[index].answer!.length; i++)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 18.0),
                  child: MaterialButton(
                  shape: StadiumBorder(),
                  color: isPressed ? questions[index].answer!.entries.toList()[i].value
                  ? StyleApp.isTrue : StyleApp.isWrong : StyleApp.secondColor,
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  onPressed: isPressed 
                  ? () {}
                  : () {
                    setState(() {
                        isPressed = true;
                    });
                    if(questions[index]
                    .answer!
                    .entries
                    .toList()[i]
                    .value){
                        // btnColor = isTrue;
                      score+=10;
                      print(score);
                    }
                  },
                  
                  child: 
                  Text(questions[index].answer!.keys.toList()[i], 
                  style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(

                      onPressed: isPressed 
                        ? index +1 == questions.length  
                        ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> 
                          ResultScreen(score)));
                        }
                        : () {
                        _controller!.nextPage(
                          duration: Duration(milliseconds: 1), 
                          curve: Curves.linear);
                          setState(() {
                            isPressed = false;
                          });
                      
                        }
                        : null, 
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.all(22.0),
                        // side: BorderSide(color: Colors.yellow, width: 2.0)
                      ),
                      child: Text(
                        index +1 == questions.length ? "See result" : "Next Question"
                        , style: TextStyle(
                        color: Colors.white
                      )),
                    ),
                  ],
                ),
              ],
            );
          },
        ),),
    );
  }
}
