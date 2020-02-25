import 'package:classapp/Utils/generate_random_colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0),
      child: Card(
        color: randomColors(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Title"),
                SizedBox(height: 15),
                Text("Notification Message"),
              ]),
        ),
      ),
    );
  }
}
