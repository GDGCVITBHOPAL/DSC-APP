import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

      //App Theming
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xff4285F4),
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff111111),
        primaryColor: Color(0xff4075E0),
        cardColor: Color(0xff1A1A1A),
        appBarTheme: AppBarTheme(
          color: Color(0xff111111),
        ),
      ),
      themeMode: ThemeMode.system,

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
