import 'package:dsc_client/authentication/EmailSignIn.dart';
import 'package:dsc_client/authentication/EmailSignInPage.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:flutter/material.dart';
import '../authentication/GoogleSignIn.dart';
import 'package:provider/provider.dart';
import 'GoogleSignIn.dart';

class GSignInPage extends StatefulWidget {
  const GSignInPage({Key? key}) : super(key: key);

  @override
  _GSignInPageState createState() => _GSignInPageState();
}

class _GSignInPageState extends State<GSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi \nWelcome Back!',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 40),
                      )
                    ],
                  )
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        // Constructor Call #2
                        child: Text(
                          'Sign In with Google',
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
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Create an account',
                              style: TextStyle(color: Colors.redAccent),
                            ))
                      ],
                    ),
                  ],
                ),
              ])),
    );
  }
}
