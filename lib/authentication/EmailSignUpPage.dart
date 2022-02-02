import 'package:dsc_client/authentication/EmailSignIn.dart';
import 'package:dsc_client/authentication/UniversalSignInPage.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/widgets/navigation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ESignUpPage extends StatefulWidget {
  ESignUpPage({Key? key}) : super(key: key);

  @override
  _ESignUpPageState createState() => _ESignUpPageState();
}

class _ESignUpPageState extends State<ESignUpPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return navigate();
          } else {
            return Form(
              key: formKey,
              child: Scaffold(
                body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Container(
                                height: 130,
                                width: 200,
                                child: Image.asset(Assets.vitb_dsc_logo)),
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi there,\nLet\'s get started!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 40),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Email"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? "Please enter a valid email"
                                  : null,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Password"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => value != null &&
                                      value.length < 8
                                  ? "Password must have more than 8 characters"
                                  : null,
                            ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // TextField(
                            //   controller: passwordController,
                            //   textInputAction: TextInputAction.done,
                            //   obscureText: true,
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(),
                            //       hintText: "Confirm Password"),
                            // ),
                          ]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  EmailSignUp();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 36,
                                  // Constructor Call #2
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 16,
                                        // Constructor Call #3
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                style: ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                    // Constructor Call #4
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.amber),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ))),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GSignInPage()));
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.green),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ])),
              ),
            );
          }
        });
  }
}
