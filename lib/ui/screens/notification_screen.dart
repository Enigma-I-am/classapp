import 'package:classapp/core/viewmodels/notification_viewmodel.dart';

import 'package:classapp/ui/widgets/notifications_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../locator.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _viewmodel = locator<NotificationViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NotificationViewmodel>.withConsumer(
      onModelReady: (model)=> model.getNotifications(),
      viewModel: _viewmodel,
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: model.getNotifications(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return BuildNotificationList(snapshot.data.documents);
              } else {
                return Text("No data");
              }
            },
          ),
        ),
      ),
    );
  }
}




class BuildNotificationList extends StatelessWidget {
  final List<DocumentSnapshot> snapshot;
  BuildNotificationList(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: snapshot.length > 0
          ? ListView(
              children: snapshot
                  .map((data) => NotificationWidget(
                        snapshot: data,
                      ))
                  .toList(),
            )
          : Text("No text"),
    );
  }
}
