import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/profile.dart';
import 'package:project_application/screens/crud/AddProduce.dart';
import 'package:project_application/screens/details/components/body.dart';
import 'package:project_application/screens/login.dart';
import 'package:project_application/screens/signup/signup_screen.dart';
import 'package:project_application/screens/home_screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_application/welcome/welcome.dart';
import 'firebase_options.dart';
import'package:project_application/screens/messages/Discussion.dart';
import 'package:project_application/screens/crud/AddProduce.dart';
import 'screens/product/productscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: '1101',
    options: 
  DefaultFirebaseOptions.currentPlatform );
    runApp( MyApp()
    );
  
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TROC APPLICATION',
      theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen() ,
    );
  }
}