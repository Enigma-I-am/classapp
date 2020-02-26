import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstName;
  String lastName;
  int level;
  String password;

  final DocumentReference reference;

  UserModel(
      {this.firstName,
      this.lastName,
      this.level,
      this.password,
      this.reference});

  // fromMap Map<dynamic, dynamic> map, {this.reference}
  UserModel.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : firstName = map["firstName"],
        lastName = map["lastName"],
        level = map["level"],
        password = map["password"];

  // fromSnapshot DocumentSnapshot snapshot
  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // Map<String, dynamic> toJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["level"] = level;
    data["password"] = password;

    return data;
  }
}

final UserModel user = UserModel();
