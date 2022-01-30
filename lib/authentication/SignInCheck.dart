import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation.dart';
import 'GoogleSignInPage.dart';

class SignInCheck extends StatefulWidget {
  const SignInCheck({Key? key}) : super(key: key);

  @override
  _SignInCheckState createState() => _SignInCheckState();
}

class _SignInCheckState extends State<SignInCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasData) {
              return navigate();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return GSignInPage();
            }
          }),
    );
  }
}
