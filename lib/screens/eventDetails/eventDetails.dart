import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/widgets/rsvp_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatelessWidget {
  final EventModel eventDetails;
  final String docId;
  EventDetails({required this.eventDetails, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(this.eventDetails.eventImageUrl!),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                color: Color(0x3E3E3E).withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      this.eventDetails.eventTitle!,
                      minFontSize: 12,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AutoSizeText(
                        "Vellore Institute of Technology, Bhopal",
                        minFontSize: 10,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      DateFormat.EEEE()
                          .add_yMMMd()
                          .add_jm()
                          .format(this.eventDetails.eventDate!),
                      minFontSize: 10,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          if (eventDetails.eventFacebookUrl!.isNotEmpty)
                            GestureDetector(
                              onTap: () async {
                                String url =
                                    this.eventDetails.eventFacebookUrl!;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Could not launch link',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                margin: EdgeInsets.only(
                                    top: 5, right: 5, bottom: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    FontAwesome.facebook,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          if (eventDetails.eventTwitterUrl!.isNotEmpty)
                            GestureDetector(
                              onTap: () async {
                                String url = this.eventDetails.eventTwitterUrl!;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Could not launch link',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    FontAwesome.twitter,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          if (eventDetails.eventLinkedInUrl!.isNotEmpty)
                            GestureDetector(
                              onTap: () async {
                                String url =
                                    this.eventDetails.eventLinkedInUrl!;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Could not launch link',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    FontAwesome.linkedin,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          if (eventDetails.eventYoutubeUrl!.isNotEmpty)
                            GestureDetector(
                              onTap: () async {
                                String url = this.eventDetails.eventYoutubeUrl!;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Could not launch link',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    FontAwesome.youtube,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'About this event',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AutoSizeText(
                  this.eventDetails.eventContent!,
                  style: GoogleFonts.poppins(
                      // fontSize: 15.0,
                      ),
                ),
              ),
            ),
            RSVPButton(docId: docId, eventDetails: eventDetails),
          ],
        ),
      ),
    );
  }
}
