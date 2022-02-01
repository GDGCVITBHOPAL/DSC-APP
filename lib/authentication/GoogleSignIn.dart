import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../authentication/SignInCheck.dart';
import 'UniversalSignInPage.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(exception){
      print(exception.toString());
    }
    notifyListeners();
  }

  Future logout(context) async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInCheck()));
  }
}