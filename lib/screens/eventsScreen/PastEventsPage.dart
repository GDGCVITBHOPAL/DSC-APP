import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class PastEventsPage extends StatefulWidget {
  @override
  _PastEventsPageState createState() => _PastEventsPageState();
}

class _PastEventsPageState extends State<PastEventsPage> {
  late FirebaseFirestore _firebaseFirestore;
  final Stream<QuerySnapshot> _eventsStream = FirebaseFirestore.instance
      .collection('events')
      .where('date', isLessThan: DateTime.now().toString())
      .snapshots();

  @override
  void initState() {
    _firebaseFirestore = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _eventsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('OOPS! Something went wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        return GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> json = document.data()!;
            return EventTile(
              docId: document.id,
              event: EventModel.fromJson(json),
            );
          }).toList(),
        );
      },
    );
  }
}
