import 'package:dsc_client/screens/onBoardScreen/NewOnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import '../authentication/SignInCheck.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> with AfterLayoutMixin<splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInCheck()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CarouselPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
