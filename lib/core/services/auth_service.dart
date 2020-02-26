import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  CollectionReference _ref;

// Create a User with email and password
  Future<bool> signUpUser(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

// Log User in with email and password
  Future<bool> logInUser(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

// Save User details
  Future<void> saveUserDetails(String path, Map data) async {
    _ref = _db.collection(path);
    _ref.add(data);
  }
}
