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
    String _email, _password;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return ViewModelProvider<LoginViewmodel>.withConsumer(
      viewModel: loginviewmodel,
      builder: (context, model, child) => Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: SvgPicture.asset(
                  //     "assests/image.svg",
                  //     height: 100.0,
                  //     width: 100.0,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Please type your email";
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      // ignore: missing_return
                      validator: (input) {
                        if (input.length < 6) {
                          return "Please type your password";
                        }
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: RaisedButton(
                          onPressed: () async {
                            final _formState = _formKey.currentState;
                            if (_formState.validate()) {
                              _formState.save();
                              try {
                                await model.login(
                                    email: _email,
                                    password: _password,
                                    errorMessage: "Failed to login",
                                    context: context);
                              } catch (e) {}
                            }
                          },
                          child: Text("Sign In"),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't Have an account??..."),
                        InkWell(
                          child: Text(
                            " SignUp!!!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic),
                          ),
                          onTap: null,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
