import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';


class NotificationModel {
  String title;
  String message;
  DocumentReference reference;

  NotificationModel(
      {@required this.title, @required this.message, this.reference});

  NotificationModel.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map["title"],
        message = map["message"];

  NotificationModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["title"] = title;
    data["message"] = message;

    return data;
  }
}
