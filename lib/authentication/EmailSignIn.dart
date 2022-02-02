import 'package:dsc_client/authentication/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/EmailSignUpPage.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();
//final confirmPasswordController = TextEditingController();

Future EmailSignIn() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      //confirmPassword: confirmPasswordController.text.trim()
    );
  } on FirebaseAuthException catch (error) {
    print(error);
  }
}

Future EmailSignUp() async {
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  } on FirebaseAuthException catch (error) {
    print(error);

    Utils.showSnackBar(error.message);
  }
}
