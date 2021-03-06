import 'package:classapp/constants/route_names.dart';

import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';

class SignUpViewmodel extends BaseViewmodel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

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

    var result = await _authenticationService.createUser(
      firstName: firstName,
      lastName: lastName,
      level: level,
      isadmin: isadmin,
      email: email,
      password: password,
      path: "Users",
    );

    setBusy(false);

    if (result is bool) {
      print(result);
      if (result) {
        _navigationService.navigateReplacmentToAndRemoveHistory(HomeViewRoute);
      }
    }
  }

  // void _showSnackbar(BuildContext context, String errorMessage) {
  //   final scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(SnackBar(content: Text(errorMessage)));
  // }
}
