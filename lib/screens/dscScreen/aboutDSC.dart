import 'package:dsc_client/configs/assets.dart';
import 'package:flutter/material.dart';

class AboutDSC extends StatefulWidget {
  @override
  _AboutDSCState createState() => _AboutDSCState();
}

class _AboutDSCState extends State<AboutDSC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Image.asset(
                    Assets.vitb_dsc_logo,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Developer Student Clubs is an initiative of Google Developers.Developer Student Clubs is an initiative of Google Developers.",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Google collaborates with DSC Leads once a year who are pursuing an undergraduate or graduate university degree and supports them as they start and grow their on-campus community. DSC activities are targeted at University students and others including faculty members who want to learn development skills & work to solve real-life problems.\n\nWe at DSC — VIT Bhopal look forward to form a community where we are able to convert our knowledge into real time application, help each student to develop in different fields of technology and make use of our knowledge to build something that helps local businesses around us as well as their community.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
