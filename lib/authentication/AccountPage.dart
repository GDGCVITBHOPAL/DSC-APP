import 'package:dsc_client/authentication/GoogleSignIn.dart';
import 'package:dsc_client/authentication/UniversalSignInPage.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

final user = FirebaseAuth.instance.currentUser!;

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
          height: 80,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
      ),
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
                // if (GoogleAuthProvider.PROVIDER_ID ==
                //     GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD) {
                //   final provider =
                //       Provider.of<GoogleSignInProvider>(context, listen: false);
                //   provider.logout(context);
                // } else {
                FirebaseAuth.instance.signOut();
                // }
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
