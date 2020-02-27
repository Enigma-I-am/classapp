import 'dart:ffi';

import 'package:classapp/constants/route_names.dart';
import 'package:classapp/core/models/user_model.dart';
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';

class SignUpViewmodel extends BaseViewmodel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  UserModel addUserDetails(String firstName, String lastName, String email,
      int level, bool isadmin) {
    final UserModel user = UserModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      level: level,
      isadmin: isadmin,
    );

    return user;
  }

  Future signUp(
      String firstName,
      String lastName,
      String email,
      int level,
      bool isadmin,
      String password,
      String errorMessage,
      BuildContext context) async {
    setBusy(true);

    var result = await _authenticationService
        .logInUser(email: email, password: password)
        .then((onvalue) async {
      await _authenticationService.saveUserDetails("Users",
          addUserDetails(firstName, lastName, email, level, isadmin).toJson());
    });

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        showSnackbar(context, errorMessage);
      }
    }
  }

  void showSnackbar(BuildContext context, String errorMessage) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
