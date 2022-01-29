import 'package:dsc_client/screens/MediumPage/ArticlesPage.dart';
import 'package:dsc_client/screens/homeScreen/home.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
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
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(data:
      NavigationBarThemeData(
        indicatorColor: Colors.green.shade400,
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
