import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
      String resultText='You did it!';
      if(resultScore>=8){
        resultText='Distinction :) \n You are good in basic concepts of DSA \n';
      }
      else if(resultScore>=5){
        resultText='\n Average\n Done better but you can still do best \n';
      }
      else{
        resultText='\n Poor score :(\n Need more practice ';
      }
       return resultText;
  }

  
@override
  Widget build(BuildContext context) {
    return Center(
          child:Column(
            children: <Widget>[
              Text(
                resultPhrase,
              style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              FlatButton(
                child: Text(
                  'Restart Quiz !',
                  ),
                  textColor: Colors.blue,
                   onPressed: resetHandler ,)
            ],
          ),
          );
  }
}