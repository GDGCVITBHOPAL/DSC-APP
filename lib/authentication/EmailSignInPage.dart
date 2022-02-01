

//This is a backup file and not used  in the project.


import 'package:dsc_client/widgets/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'EmailSignIn.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({Key? key}) : super(key: key);

  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return navigate();
          } else {
            return Scaffold(
                body: Column(
              children: [
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      EmailSignIn();
                    },
                    child: Text('Sign In'))
              ],
            ));
          }
        });
  }
}
