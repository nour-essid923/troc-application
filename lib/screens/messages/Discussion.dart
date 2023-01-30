
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(132,187,153,129),
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
     backgroundColor: Color.fromARGB(132,187,153,129);
    return AppBar(
      backgroundColor: Color.fromARGB(132,187,153,129),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: 20.0 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nour Essid",
                style: TextStyle(fontSize: 16),
              ),
              
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: 20.0 / 2),
      ],
    );
  }
}