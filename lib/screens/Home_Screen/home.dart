import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/screens/home_screen/component/body.dart';
import '../../profile.dart';
import 'dart:js';
import 'dart:async';
import 'package:path/path.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(product: Product()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            "/icons/loupe.png",
            // By default our  icon color is white
            color: Color(0xFF535353),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            "/icons/shopping-cart.png",
            // By default our  icon color is white
            color:Color(0xFF535353),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            "/icons/user.png",
            // By default our  icon color is white
            color: Color(0xFF535353),
          ),
                     onPressed: ()  {
  Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage()),
  );
}
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}