import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class FireAuth {
  static Future<User?> registerUsingEmailPassword({
    required String firstname,
    required String lastname,
    required String birthday,
    required String region,
    required String email,
    required String password,
    required String conformpassword,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: firstname);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

static Future<User?> signInUsingEmailPassword({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  return user;
}
FirebaseAuth.instance.signOut();}
}
