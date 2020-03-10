import 'package:classapp/constants/route_names.dart';
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'baseviewmodel.dart';

class LoginViewmodel extends BaseViewmodel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login(
      {@required String email,
      @required String password,
      @required String errorMessage,
      @required BuildContext context}) async {
    setBusy(true);

    var result = await _authenticationService.logInUser(
        email: email, password: password);

    setBusy(false);

    if (result is bool) {
      print(result);
      if (result) {
        _navigationService.navigateReplacmentToAndRemoveHistory(HomeViewRoute);
      } 
    }
  }

  void routeToSignUpPage(String routeName) {
    _navigationService.navigateReplacmentTo(routeName);
  }

}
