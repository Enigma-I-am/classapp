import 'package:classapp/core/models/user_model.dart';
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';

class BaseViewmodel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  UserModel get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
