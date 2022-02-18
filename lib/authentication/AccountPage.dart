import 'package:dsc_client/authentication/GoogleSignIn.dart';
import 'package:dsc_client/authentication/UniversalSignInPage.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: true);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Currently Logged in as:"),
          SizedBox(
            height: 20,
          ),
          Text(user.email!),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => GSignInPage()));

                provider.logout(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 36,
                // Constructor Call #2
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
          ),
        ],
      )),
    );
  }
}
