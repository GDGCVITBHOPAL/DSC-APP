import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:dsc_client/data/models/eventsModel.dart';
import 'package:dsc_client/screens/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';

class PastEventsPage extends StatefulWidget {
  @override
  _PastEventsPageState createState() => _PastEventsPageState();
}

class _PastEventsPageState extends State<PastEventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        .collection('past events')
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
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(child: Image.asset(Assets.vitb_dsc_logo)),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 8.0,
                          top: 8.0,
                          right: 8.0,
                          bottom: _events.length - 1 == index ? 100 : 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventDetails(
                                        eventDetails: _events[index],
                                      )));
                        },
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AutoSizeText(
                                    _events[index].eventTitle!,
                                    minFontSize: 12,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: AutoSizeText(
                                      _events[index].eventDesc!,
                                    ),
                                  ),
                                  Text(_events[index].eventTime!),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  "Explore more >",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
