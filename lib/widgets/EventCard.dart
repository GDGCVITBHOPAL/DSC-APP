import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/screens/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
          //key: ValueKey(this.event.id!),
          title: Text(this.event.eventTitle!),
          subtitle: Text(this.event.eventDesc!),
          trailing: Text(this.event.eventDate!),
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
