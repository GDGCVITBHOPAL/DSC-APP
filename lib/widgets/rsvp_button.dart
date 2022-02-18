import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RSVPButton extends StatefulWidget {
  final String docId;
  final EventModel eventDetails;

  const RSVPButton({Key? key, required this.docId, required this.eventDetails})
      : super(key: key);

  @override
  _RSVPButtonState createState() => _RSVPButtonState();
}

class _RSVPButtonState extends State<RSVPButton> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final events = FirebaseFirestore.instance.collection('events');
  late bool isAttending;

  Future<void> rsvpYes() {
    return events.doc(widget.docId).update({
      'rsvp': FieldValue.arrayUnion([uid])
    }).then((_) {
      print('User: $uid RSVP\'d Yes');
      setState(() {
        isAttending = true;
      });
    }).catchError((_) => print("Failed to update rsvp"));
  }

  Future<void> rsvpNo() {
    widget.eventDetails.rsvp!.remove(uid);

    return events.doc(widget.docId).update({
      'rsvp': FieldValue.arrayRemove([uid])
    }).then((_) {
      print('User: {$uid} RSVP\'d No');
      setState(() {
        isAttending = false;
      });
    }).catchError((_) => print("Failed to update rsvp"));
  }

  @override
  void initState() {
    super.initState();
    isAttending = widget.eventDetails.rsvp!.contains(uid);
    print(isAttending);
  }

  @override
  Widget build(BuildContext context) {
    return isAttending
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: rsvpNo,
              child: Text(
                'No, I won\'t attend',
                style: GoogleFonts.openSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: rsvpYes,
              child: Text(
                'Yes, I will attend',
                style: GoogleFonts.openSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
  }
}
