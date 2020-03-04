import 'package:classapp/core/models/user_model.dart';
import 'package:classapp/core/services/firestore_service.dart';
import 'package:classapp/ui/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _currentUser;

  final firestoreService = locator<FirestoreServcie>();
// Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    return user != null;
  }

// Create a User with email and password
  Future createUser({
    @required String firstName,
    @required String lastName,
    @required int level,
    @required bool isadmin,
    @required String email,
    @required String password,
    @required String path,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = UserModel(
          id: authResult.user.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          level: level,
          isadmin: isadmin);
        await firestoreService.addUserToUserCollection(path, _currentUser);

      return authResult.user != null;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

// Log User in with email and password
  Future logInUser({@required String email, @required String password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

// Save User details

}
