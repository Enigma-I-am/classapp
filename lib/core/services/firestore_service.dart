import 'dart:async';


import 'package:classapp/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServcie {
  final Firestore _db = Firestore.instance;
  CollectionReference _ref;

  Future addUserToUserCollection(String path, UserModel userModel) async {
    try {
      _ref = _db.collection(path);
      _ref.document(userModel.id).setData(userModel.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUser(String uid) async {
    try {
      _ref = _db.collection("Users");
      var userData = await _ref.document(uid).get();
      return UserModel.fromMap(userData.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot> getNotificationsAsStream(){
    _ref = _db.collection("notification");
    return _ref.snapshots();
  }

  Stream<QuerySnapshot> getMondayAsStream() {
    _ref = _db.collection("monday");
    print(_ref.snapshots().first);
    return _ref.snapshots();
  }

  Stream<QuerySnapshot> getTuesdayAsStream() {
    _ref = _db.collection("tuesday");
    return _ref.snapshots();
  }

  Stream<QuerySnapshot> getWednesdayAsStream() {
    _ref = _db.collection("wednesday");
    return _ref.snapshots();
  }

  Stream<QuerySnapshot> getThursdayAsStream(){
    _ref = _db.collection("thursday");
    return _ref.snapshots();
  }

  Stream<QuerySnapshot> getFridayAsStream(){
    _ref = _db.collection("friday");
    return _ref.snapshots();
  }
}
