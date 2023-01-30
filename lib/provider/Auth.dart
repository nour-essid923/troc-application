import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/screens/login.dart';
import 'package:project_application/screens/home_screen/home.dart';
import 'package:project_application/screens/signup/signup_screen.dart';
import 'package:project_application/models/UserModel.dart';
import 'package:firebase_storage/firebase_storage.dart';


class AuthServices {
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");
       

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage;

 


 

 //Future addProduct( String title, String description,String phone,
      //BuildContext context) async {
   
      //final result = await _auth.createProductWithImageAndTitle(
        //  title: title, phone: phone);
      //if (result.product != null) {
        //await AuthServices().saveProduct(Product(
          //  id: result.product!.id,
            //title: title,
            //description: description,
            //phone:phone,
           
          
            //));

        //Fluttertoast.showToast(msg: "added Successful ");
        //Navigator.of(context).pushReplacement(
           // MaterialPageRoute(builder: (context) => HomeScreen()));
      
      //}}

 Future<User?> get user async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }
  Future saveUser(UserModel user) async {
    try {
      await usercol.doc(user.uid).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getUser(String id) async {
    try {
      final data = await usercol.doc(id).get();
      //final user = UserModel.fromMap(data.get(data));
      return user;
    } catch (e) {
      return false;
    }
  }

  Future signIn(String email, String pass, BuildContext context) async {
    try {
      final result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      if (result.user != null) {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

   Future signUp( String firstname, String lastname,String phone, String email, String pass, String confpass,
      BuildContext context) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (result.user != null) {
        await AuthServices().saveUser(UserModel(
            uid: result.user!.uid,
            firstname: firstname,
            lastname: lastname,
            phone:phone,
           
            email: email,
            password: pass,
            confpass: confpass
            


            ));

        Fluttertoast.showToast(msg: "Register Successful Please Login");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}



