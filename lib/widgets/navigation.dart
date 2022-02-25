import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_client/authentication/AccountPage.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/screens/MediumPage/ArticlesPage.dart';
import 'package:dsc_client/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_client/screens/eventsScreen/EventsPage.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
import 'package:dsc_client/screens/team/TeamPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class navigate extends StatefulWidget {
  const navigate({Key? key}) : super(key: key);

  @override
  _navigateState createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  int current_index = 0;
  final screens = [EventsPage(), ArticlesPage(), AccountPage()];
  //Firebase User data
  final user = FirebaseAuth.instance.currentUser!;
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    ),
                child: Theme.of(context).brightness == Brightness.light
                    ? Image.asset(Assets.vitb_dsc_logo)
                    : Image.asset('assets/images/dark.png')),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDSC()));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Our Team'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Team()));
              },
            ),
            ListTile(
              title: const Text('Request an event'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RequestEventForm()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
            height: 80.h,
            width: 250.w,
            child: Theme.of(context).brightness == Brightness.light
                ? Image.asset(Assets.vitb_dsc_logo)
                : Image.asset('assets/images/dark.png')
            //,
            ),
        centerTitle: true,
      ),
      body: IndexedStack(
        children: screens,
        index: current_index,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade100
              : Colors.grey.shade800,
          indicatorColor: Theme.of(context).brightness == Brightness.light
              ? Colors.blue.shade400
              : Colors.blue.shade200,
          //iconTheme: ,
          height: 70,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        child: NavigationBar(
          selectedIndex: current_index,
          onDestinationSelected: (index) =>
              setState(() => this.current_index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.event_outlined),
              label: 'Events',
              selectedIcon: Icon(Icons.event),
            ),
            NavigationDestination(
                icon: Icon(Icons.article_outlined),
                label: 'Articles',
                selectedIcon: Icon(Icons.article)),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
              selectedIcon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
