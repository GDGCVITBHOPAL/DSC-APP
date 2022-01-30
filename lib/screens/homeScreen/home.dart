import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/screens/MediumPage/ArticlesPage.dart';
import 'package:dsc_client/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_client/screens/eventsScreen/EventsPage.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
import 'package:dsc_client/screens/team/team.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String route = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTab = 1;
  int _currentIndex = 0;
  final _pages = [
    EventsPage(),
    ArticlesPage(),
    RequestEventForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
          height: 60,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
      ),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support_rounded),
            label: 'Request Event',
          )
        ],
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: _currentIndex,
      ),
      body: IndexedStack(
        children: _pages,
        index: _currentIndex,
      ),
    );
  }
}
