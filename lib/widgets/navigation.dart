import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/screens/MediumPage/ArticlesPage.dart';
import 'package:dsc_client/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_client/screens/homeScreen/home.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
import 'package:dsc_client/screens/team/team.dart';
import 'package:flutter/material.dart';

class navigate extends StatefulWidget {
  const navigate({Key? key}) : super(key: key);

  @override
  _navigateState createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  int index =0;
  final screens=[Home(), ArticlesPage(),RequestEventForm()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                 DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(Assets.vitb_dsc_logo),
                ),
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutDSC()));
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Our Team'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Team()));
                  },
                ),
              ],
            ),
          ),

      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title:
      Container(
          height: 80,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data:
      NavigationBarThemeData(
        indicatorColor: Colors.blue.shade100,
        // iconTheme: MaterialStateProperty(),
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index)=>setState(()=>this.index=index),

          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home', selectedIcon: Icon(Icons.home),),
            NavigationDestination(icon: Icon(Icons.article_outlined), label: 'Articles',selectedIcon: Icon(Icons.article)),
            NavigationDestination(icon: Icon(Icons.question_answer_outlined), label: 'Request',selectedIcon: Icon(Icons.question_answer),),
          ],
        ),
      ),
    );
  }
}
