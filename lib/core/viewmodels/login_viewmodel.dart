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

    var result = await _authenticationService.signUpUser(
        email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateReplacmentTo(HomeViewRoute);
      } else {
        showSnackbar(context, errorMessage);
      }
    }
  }

  void routeToSignUpPage(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void showSnackbar(BuildContext context, String errorMessage) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
