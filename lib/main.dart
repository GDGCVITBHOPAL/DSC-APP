import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/eventDetails/eventDetails.dart';
import 'constants.dart';
import 'screens/homeScreen/home.dart';
import 'screens/onBoardScreen/onBoardingPage.dart';

bool isHomeScreen = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  isHomeScreen =
      await (CustomSharedPreferences.get("IS_FIRST_TIME_RUN")) ?? true;

  runApp(DSC());
}

class DSC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
        // accentColor: MyColors.accentColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme().copyWith(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme().copyWith(
            headline6: Theme.of(context)
                .primaryTextTheme
                .headline6!
                .copyWith(color: MyColors.primaryColor),
          ),
        ),
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2:
                GoogleFonts.quicksand(textStyle: TextStyle(fontSize: 14.0))),
      ),
      initialRoute: isHomeScreen ? '/' : '/home',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => OnBoardingScreen(),
                settings: settings);
          case '/home':
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => Home(), settings: settings);
          case '/eventDetails':
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => EventDetails(), settings: settings);
          default:
            return PageRouteBuilder(
              pageBuilder: (_, a1, a2) => Home(),
              settings: settings,
            );
        }
      },
    );
  }
}
