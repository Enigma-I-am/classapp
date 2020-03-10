import 'package:classapp/ui/widgets/time_table_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildList extends StatelessWidget {
  final List<DocumentSnapshot> snapshot;
  BuildList(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: snapshot.length > 0
          ? ListView(
              children: snapshot
                  .map((data) => TimeTableCard(
                        snapshot: data,
                      ))
                  .toList(),
            )
          : Text("No text"),
    );
  }
}