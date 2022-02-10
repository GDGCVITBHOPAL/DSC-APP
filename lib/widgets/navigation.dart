import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_client/authentication/AccountPage.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/screens/MediumPage/ArticlesPage.dart';
import 'package:dsc_client/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_client/screens/eventsScreen/EventsPage.dart';
import 'package:dsc_client/screens/homeScreen/home.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
import 'package:dsc_client/screens/team/team.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class navigate extends StatefulWidget {
  const navigate({Key? key}) : super(key: key);

  @override
  _navigateState createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  int current_index = 0;
  final screens = [EventsPage(), ArticlesPage(), RequestEventForm()];
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
              child: Image.asset(Assets.vitb_dsc_logo),
            ),
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
              title: const Text('Your Account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
          height: 80,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        children: screens,
        index: current_index,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade200,
          height: 60,
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
              icon: Icon(Icons.contact_support_outlined),
              label: 'Request',
              selectedIcon: Icon(Icons.contact_support),
            ),
          ],
        ),
      ),
    );
  }
}
