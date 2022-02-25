import 'package:dsc_client/authentication/GoogleSignIn.dart';
import 'package:dsc_client/authentication/Utils.dart';
import 'package:dsc_client/screens/splash.dart';
import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../authentication/Utils.dart';

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        //App Theming
        theme: ThemeData(
          brightness: Brightness.light,
          drawerTheme: DrawerThemeData(backgroundColor: Colors.grey.shade200),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue.shade300,
          cardColor: Colors.grey.shade200,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          drawerTheme: DrawerThemeData(backgroundColor: Colors.grey.shade900),
          scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.blue.shade200,
          cardColor: Colors.grey.shade800,
          listTileTheme: ListTileThemeData(tileColor: Colors.grey.shade800),
          appBarTheme: AppBarTheme(
            color: Colors.grey.shade900,
          ),
        ),
        themeMode: ThemeMode.system,
        title: 'DSC VITB',
        //Redirect to splash for first-time check
        home: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: () => splash(),
        ),
      ));
}
