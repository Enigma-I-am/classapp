import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class TimeTableModel {
  String CourseTitle;
  String CourseCode;
  String Endtime;
  String Starttime;
  String Location;

  final DocumentReference reference;

  TimeTableModel(
      {@required this.CourseTitle,
      @required this.CourseCode,
      @required this.Starttime,
      @required this.Endtime,
      @required this.Location,
      @required this.reference});

    // fromMap Map<dynamic, dynamic> map, {this.reference}
  TimeTableModel.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : CourseTitle = map["CourseTitle"],
        CourseCode = map["CourseCode"],
        Starttime = map["Starttime"],
        Endtime = map["Endtime"],
        Location = map["Location"];

  // fromSnapshot DocumentSnapshot snapshot
  TimeTableModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // Map<String, dynamic> toJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["CourseTitle"] = CourseTitle;
    data["CourseCode"] = CourseCode;
    data["Starttime"] = Starttime;
    data["Endtime"] = Endtime;
    data["Location"] = Location;
    

    return data;
  }
}
