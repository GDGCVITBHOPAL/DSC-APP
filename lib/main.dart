import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:dsc_client/widgets/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
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

      //App Theming
      theme: ThemeData(
        brightness: Brightness.light,    //light mode uses white app color and black font color
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade800))
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,    //dark mode uses grey app color and white font color
        scaffoldBackgroundColor: Color(0xff404040),
          appBarTheme: AppBarTheme(
              color: Color(0xff404040),
              iconTheme: IconThemeData(color: Colors.white))
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
                pageBuilder: (_, a1, a2) => navigate(), settings: settings);
          case '/eventDetails':
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => EventDetails(), settings: settings);
          default:
            return PageRouteBuilder(
              pageBuilder: (_, a1, a2) => navigate(),
              settings: settings,
            );
        }
      },
    );
  }
}
