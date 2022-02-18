import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            child: TextButton(
              onPressed: () {
                rsvpNo();
              },
              child: Container(
                alignment: Alignment.center,
                height: 36,
                // Constructor Call #2
                child: Text(
                  'No, can\'t attend',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.red.shade400),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                rsvpYes();
              },
              child: Container(
                alignment: Alignment.center,
                height: 36,
                // Constructor Call #2
                child: Text(
                  'Yes, I\'m attending',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade400),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
          );
  }
}
