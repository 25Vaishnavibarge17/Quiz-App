import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 64, 226, 255),
      ),
      child: SizedBox(
        width: 80,
        height: 80,
        child: TextButton(
          child: Text(
            answerText,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
          ),
          onPressed: selectHandler,
        ),
      ),
      // color: Colors.amberAccent,
    );
  }
}
