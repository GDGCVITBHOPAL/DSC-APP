import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/widgets/EventCard.dart';
import 'package:flutter/material.dart';

class UpcomingEventsPage extends StatefulWidget {
  @override
  _UpcomingEventsPageState createState() => _UpcomingEventsPageState();
}

class _UpcomingEventsPageState extends State<UpcomingEventsPage> {
  late FirebaseFirestore _firebaseFirestore;

  List<EventModel> _events = [];
  @override
  void initState() {
    _firebaseFirestore = FirebaseFirestore.instance;
    getData();
    super.initState();
  }

  void getData() {
    final qurey = _firebaseFirestore
        .collection('upcoming events')
        .orderBy('priority', descending: false);

    qurey.snapshots().forEach((element) {
      element.docs.forEach((event) {
        EventModel events = EventModel();
        events.eventDesc = event.data()!['description'];
        events.eventName = event.data()!['title'];
        events.eventDate = event.data()!['time'];
        events.eventDay = event.data()!['eventDay'];
        events.eventHashTag = event.data()!['eventHashtag'];
        events.eventMoreInfoLink = event.data()!['urlToEvent'];
        events.eventPoster = event.data()!['imageUrl'];
        events.eventTime = event.data()!['time'];
        events.eventTitle = event.data()!['title'];
        events.eventURL = event.data()!['urlToEvent'];
        setState(() {
          _events.add(events);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return EventCard(event: _events[index]);
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.0,
                ),
            itemCount: _events.length));
  }
}
