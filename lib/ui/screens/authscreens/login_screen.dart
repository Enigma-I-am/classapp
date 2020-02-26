import 'package:classapp/core/viewmodels/login_viewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginviewmodel = locator<LoginViewmodel>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewmodel>.withConsumer(
        viewModel: loginviewmodel,
        builder: (context, model, child) => Scaffold(
          body: 
        ));
  }
}
