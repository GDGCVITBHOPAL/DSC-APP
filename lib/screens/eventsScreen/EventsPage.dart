import 'package:dsc_client/screens/eventsScreen/PastEventsPage.dart';
import 'package:dsc_client/screens/eventsScreen/UpcomingEventsPage.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Upcoming',
                  icon: Icon(Icons.upcoming),
                ),
                Tab(
                  text: 'Previous',
                  icon: Icon(Icons.history_rounded),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                UpcomingEventsPage(),
                PastEventsPage(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
