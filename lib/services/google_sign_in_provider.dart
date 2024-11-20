import 'package:MahiGo_Fix/utils/Common/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/botoom bar/bottom_bar.dart';
import '../view/home  Screen/home_screen.dart';
import '../view/unauth/unauth.dart';

class GoogleSignInProvider {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Google
  static Future<bool> signInWithGoogle(context) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      showSnake(context, e.message.toString());
      return false;
    } catch (e) {
      showSnake(context, e.toString());
      return false;
    }
  }

  static Future<bool> createWithEmailAndPassword(
      {required context,
      required String email,
      required String password}) async {
    try {
      var credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomBar(),
        ));
      } else {
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      showSnake(context, e.message.toString());
      return false;
    } catch (e) {
      showSnake(context, e.toString());
      return false;
    }
  }

  static Future<bool> signInWithEmailAndPassword(
      {required context,
      required String email,
      required String password}) async {
    try {
      var credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomBar(),
        ));
      } else {
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      showSnake(context, e.message.toString());
      return false;
    } catch (e) {
      showSnake(context, e.toString());
      return false;
    }
  }

  // Sign out
  static Future<void> signOut(context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => UnAuth(),
      ),
    );
  }
}

void showSnake(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(
        text: text,
        fontSize: 16,
        textColor: Colors.white,
      ),
    ),
  );
}
