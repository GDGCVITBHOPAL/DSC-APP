import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/screens/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: ListTile(
          //key: ValueKey(this.event.id!),
          title: Text(
            this.event.eventTitle!,
            style: GoogleFonts.rubik(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            this.event.eventDesc!,
            style: GoogleFonts.rubik(
              fontSize: 16.0,
            ),
          ),
          trailing: Text(
            this.event.eventDate!,
            style: GoogleFonts.rubik(
              fontSize: 14.0,
            ),
          ),
          isThreeLine: true,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventDetails(
                      eventDetails: this.event,
                    )));
          }),
    );
  }
}
