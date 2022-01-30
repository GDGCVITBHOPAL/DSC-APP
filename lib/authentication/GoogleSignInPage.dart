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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
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

              ////////// Styling //////////
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  // Constructor Call #4
                  backgroundColor: MaterialStateProperty.all(Color(0xff363250)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                print('pressed button -> create an account');
              },

              child: Container(
                alignment: Alignment.center,
                height: 36,
                // Constructor Call #2
                child: Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 16,
                      // Constructor Call #3
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),

              ////////// Styling //////////
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  // Constructor Call #4
                  backgroundColor: MaterialStateProperty.all(Color(0xffb23fff)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
