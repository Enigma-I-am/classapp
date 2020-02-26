
import 'package:classapp/constants/route_names.dart';
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';

class SignUpViewmodel extends BaseViewmodel{

    final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp(
      {@required String email,
      @required String password,
      @required String errorMessage,
      @required BuildContext context}) async {
    setBusy(true);

    var result = await _authenticationService.logInUser(
        email: email, password: password);

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