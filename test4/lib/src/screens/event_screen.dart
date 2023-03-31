import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test4/models/event_detail.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late final FirebaseFirestore db;
  List<EventDetail> details = [];

  @override
  void initState() {
    if (mounted) {
      getDetailList().then((data) {
        setState(() {
          details = data;
        });
      });
    }

    super.initState();
  }

  Future<List<EventDetail>> getDetailList() async {
    await Firebase.initializeApp();
    db = FirebaseFirestore.instance;
    var data = await db.collection('event_detail').get();
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
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: details.length,
        itemBuilder: (context, position) {
          String sub = 'Date: ${details[position].date} - Start:  }'
              '${details[position].startTime} - End ${details[position].endTime} ';
          return ListTile(
            title: Text(details[position].description),
            subtitle: Text(sub),
          );
        });
  }
}

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
      ),
      body: const EventList(),
    );
  }
}
