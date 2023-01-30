import 'package:project_application/models/ChatMessage.dart';
import 'package:flutter/material.dart';



class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: MediaQuery.of(context).platformBrightness == Brightness.dark
          //? Colors.white
          //: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal:20.0 * 0.75,
        vertical:20.0/ 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF00BF6D).withOpacity(message!.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message!.text,
        style: TextStyle(
          color: message!.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}