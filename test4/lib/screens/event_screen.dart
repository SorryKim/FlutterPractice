import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/event_detail.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
      ),
      body: EventList(),
    );
  }
}

class EventList extends StatefulWidget {
  EventList({super.key}) {
    Firebase.initializeApp();
  }

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<EventDetail> details = [];

  Future<List<EventDetail>> getDetailsList() async {
    var data = await db.collection('event_details').get();

    details =
        data.docs.map((document) => EventDetail.fromMap(document)).toList();

    int i = 0;
    for (var detail in details) {
      detail.id = data.docs[i].id;
      i++;
    }

    return details;
  }

  @override
  void initState() {
    if (mounted) {
      getDetailsList().then((data) {
        setState(() {
          details = data;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, position) {
        String sub =
            'Date: ${details[position].date} - Start: ${details[position].startTime} - End: ${details[position].endTime}';
        return ListTile(
          title: Text(details[position].description),
          subtitle: Text(sub),
        );
      },
    );
  }
}
