import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/screens/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  final EventModel event;
  final String docId;
  const EventTile({Key? key, required this.event, required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventDetails(
                  docId: this.docId,
                  eventDetails: this.event,
                )));
      },
      child: Card(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                event.eventImageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                DateFormat.yMMMd().format(this.event.eventDate!),
                style: GoogleFonts.rubik(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                event.eventType!,
                style: GoogleFonts.rubik(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                event.eventTitle!,
                style: GoogleFonts.rubik(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
