import 'package:classapp/ui/screens/timetablescreens/build_timetable_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WednesdayTimeTableScreen extends StatelessWidget {
  final Stream<QuerySnapshot> myStream;
  WednesdayTimeTableScreen(this.myStream);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: myStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return BuildList(snapshot.data.documents);
        }
      },
    );
  }
}