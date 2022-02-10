import 'package:dsc_client/authentication/EmailSignIn.dart';
import 'package:dsc_client/authentication/EmailSignUpPage.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/widgets/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/GoogleSignIn.dart';
import 'package:provider/provider.dart';
import 'GoogleSignIn.dart';

class GSignInPage extends StatelessWidget {
  const GSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: true);
    return StreamBuilder<User?>(

        /*Listens to changes is login state for Email based accounts and redirects
        to homepage on valid request*/

        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return navigate();
          } else {
            return Scaffold(
                body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Column(
                            children: [
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
                                    'Hi there,\nWelcome Back!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 40),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Email"),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Password"),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              TextButton(
                                onPressed: () {
                                  EmailSignIn();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 36,
                                  // Constructor Call #2
                                  child: Text(
                                    'Sign In with Email',
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
                              TextButton(
                                onPressed: () {
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
                                        MaterialStateProperty.all(Colors.red),
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
                                    Text("Don't have an account?"),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ESignUpPage()));
                                        },
                                        child: Text(
                                          'Create an account',
                                          style: TextStyle(color: Colors.green),
                                        ))
                                  ]),
                            ],
                          ),
                        ]))));
          }
        });
  }
}
