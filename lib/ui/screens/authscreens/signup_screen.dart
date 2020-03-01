import 'package:classapp/core/viewmodels/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:dropdownfield/dropdownfield.dart';
import '../../locator.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final signUpViewmodel = locator<SignUpViewmodel>();

  String _email, _password, _firstName, _lastName;
  int _level;

  static const levelItems = ["1", "2", "3", "4", "5"];
  var currentSelectedValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewmodel>.withConsumer(
      viewModel: signUpViewmodel,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text("Sign Up")),
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                          return "Please type your first name";
                        }
                      },
                      onSaved: (input) => _firstName = input,
                      decoration: InputDecoration(
                        labelText: 'First Name',
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
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Please type your last name";
                        }
                      },
                      onSaved: (input) => _lastName = input,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
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
                    padding: EdgeInsets.all(8.0),
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("What's your level"),
                              value: currentSelectedValue,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue = newValue;
                                  _level = int.tryParse(newValue);
                                });
                                print(currentSelectedValue);
                              },
                              items: levelItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.poppins(
                                      textStyle:
                                          Theme.of(context).textTheme.display1,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
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
                                await model.signUp(
                                    _firstName,
                                    _lastName,
                                    _email,
                                    _level,
                                    false,
                                    _password,
                                    "Cannot create account",
                                    context);
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          child: Text("SignUp"),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
