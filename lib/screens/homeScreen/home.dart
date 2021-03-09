import 'package:dsc_client/screens/Medium%20Page/ArticlesPage.dart';
import 'package:dsc_client/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_client/screens/requestEvents/requestEvent.dart';
import 'package:dsc_client/screens/team/team.dart';
import 'package:dsc_client/screens/eventsScreen/PastEventsPage.dart';
import 'package:dsc_client/screens/eventsScreen/UpcomingEventsPage.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
  static const String route = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          selectedTab == 1 ? UpcomingEventsPage() : PastEventsPage(),
          Positioned(
            bottom: 20.0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.grey.shade400,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => Home()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Constants.googleLogoColorsList[0],
                      child: Image.asset(
                        "assets/images/upcoming-removebg.png",
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => Container(
                            height: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  spreadRadius: 3.0,
                                  color: Colors.grey.shade600,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.linear_scale,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ListTile(
                                  title: Text(
                                    "About DSC",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AboutDSC()));
                                  },
                                ),
                                ListTile(
                                  title: Text("Team Members",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black)),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Team()));
                                  },
                                ),
                                ListTile(
                                  title: Text("Medium Articles",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black)),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ArticlesPage()));
                                  },
                                ),
                                ListTile(
                                  title: Text("Request an Event",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black)),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RequestEventForm()));
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/main_logo.png",
                        height: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0; // pastEvent
                      });
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => PastEventsPage()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Constants.googleLogoColorsList[0],
                      child: Image.asset(
                        "assets/images/PastEvents.png",
                        color: Colors.white,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // buildShowBottomSheet(BuildContext context) {
  //   return }
}
