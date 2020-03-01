import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  CollectionReference _ref;

// Create a User with email and password
  Future createUser(
      {@required String email, @required String password, @required String path, @required Map data}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((onValue){
            _ref = _db.collection(path);
            _ref.add(data);
            return onValue;
          });
      return authResult.user != null;

    } catch(error) {

      print(error.toString());
      return error.toString();
    }
  }

// Log User in with email and password
  Future logInUser(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          
      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

// Save User details
  // Future<void> saveUserDetails(String path, Map data) async {
  //   _ref = _db.collection(path);
  //   _ref.add(data);
  // }
}
