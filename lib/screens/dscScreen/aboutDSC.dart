import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutDSC extends StatefulWidget {
  @override
  _AboutDSCState createState() => _AboutDSCState();
}

class _AboutDSCState extends State<AboutDSC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
          height: 80,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.team_design),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Developer Student Clubs is an initiative of Google Developers.Developer Student Clubs is an initiative of Google Developers.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AutoSizeText(
                    " DSC activities are targeted at University students and others including faculty members who want to learn development skills & work to solve real-life problems.\n\nWe at DSC — VIT Bhopal look forward to form a community where we are able to convert our knowledge into real time application, help each student to develop in different fields of technology and make use of our knowledge to build something that helps local businesses around us as well as their community.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      letterSpacing: 1.2,
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
