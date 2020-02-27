import 'package:classapp/core/viewmodels/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final signUpViewmodel = locator<SignUpViewmodel>();

  @override
  Widget build(BuildContext context) {
    String _email, _password, _firstName, _lastName;
    String dropDownLevelvalue = '1';
    int _level = 1;

    var levelItems = ["1", "2", "3", "4", "5"];
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Level",
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: DropdownButtonFormField<String>(
                                 
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  items: levelItems
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue){
                                    setState(() {
                                      dropDownLevelvalue = newValue;
                                      _level = int.tryParse(newValue) ;
                                    });
                                  }),
                            ),
                          )
                        ],
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
                              try {} catch (e) {}
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
