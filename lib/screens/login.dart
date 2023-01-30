import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_application/main.dart';
import 'package:project_application/profile.dart';
import 'package:project_application/screens/fire_auth.dart';
import 'package:project_application/screens/home_screen/home.dart';
import 'package:project_application/provider/Auth.dart';
import 'dart:async';

import 'package:project_application/screens/signup/signup_screen.dart';



    //User? user = FirebaseAuth.instance.currentUser;
    //if (user != null) {
      //Navigator.of(context).pushReplacement(
        //MaterialPageRoute(
          //builder: (context) => ProfilePage(
            //user: user,
          //),
        //),
      //);
    //}
    class Login extends StatelessWidget {
  late String email,pass;
    final _auth = FirebaseAuth.instance;
 final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
     final _formKey = GlobalKey<FormState>(); 
     @override 
      //_LoginScreenState createState() => _LoginScreenState();}
      //class _LoginScreenState extends State<Login>{

  Widget build(BuildContext context) {
        bool _passwordVisible;
    AuthServices authServices = AuthServices();
    
    
     final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
        
      final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 94, 82, 102),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              authServices.signIn(emailController.text, passwordController.text,  context);
            }
          },
          color: Color(0xC3588162),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          

                        ),
          child: const Text(
                         "LOGIN", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                          color: Colors.white,

                        ),),
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(132,187,153,129),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size: 14,
          color: Colors.black,),


        ),
      ),
      
      
       body: Center(
        child: SingleChildScrollView(
          child: Container(
            color:  Color.fromARGB(132, 187, 153, 129),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        child: Image.asset(
                          "assets/images/troc.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                  
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                  
                    signUpButton,
                    SizedBox(height: 15),
                             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    
                   TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                    
                   //Color c = const Color(0xFF42A5F5);
                                        
                  ),
                  
                  onPressed: ()  {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignUp()),
  );
}
                        
                  
                )
                  ],
                ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
 
}
