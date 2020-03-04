import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  int level;
  bool isadmin;
  // String password;

  final DocumentReference reference;

  UserModel(
      {@required id,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.level,
      @required this.isadmin,
      this.reference});

  // fromMap Map<dynamic, dynamic> map, {this.reference}
  UserModel.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : id = map["id"],
        firstName = map["firstName"],
        lastName = map["lastName"],
        email = map["email"],
        level = map["level"],
        isadmin = map["isadmin"];

  // fromSnapshot DocumentSnapshot snapshot
  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // Map<String, dynamic> toJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["level"] = level;
    data["isadmin"] = isadmin;

    return data;
  }
}
