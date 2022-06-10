import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/views/signin.dart';

import '../services/auth.dart';
import '../widgets/widgets.dart';
import 'home.dart';
// ignore_for_file: prefer_const_constructors

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String id = 'signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

// THIS IS THE CLASS YOU WILL BE WORKING ON

class _SignUpState extends State<SignUp> {
  Auth authService = new Auth();
// this form key keeps the the state of the form and is used for the validation using flutter
  final _formKey = GlobalKey<FormState>();
  //Global variables to store email and password and name
  late String email, password, name;

  //this will be used to when there is a bit of delay for the data to come
  bool _isLoading = false;

  //This method is called in the signup button to signup a new user
  signUp() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      await authService
          .signUpWithEmailAndPassword(email, password)
          .then((value) {
        Navigator.pushReplacementNamed(context, Home.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppBar(context),
        centerTitle: true,
        backgroundColor: Colors
            .transparent, //this makes the app bar transparent and takes the color of the background
        elevation: 0.0, //because of this the transparent effect is gone
        brightness:
            Brightness.light, //this brought back the battery indication bar
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Spacer(),
                    //name text form field
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? 'Enter your name' : null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    // email text form field
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? 'Enter an Email' : null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    // password text form field
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? 'Enter a password' : null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //Sign in button

                    GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: kRoundedButton(context, 'Sign-Up'),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account? ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, SignIn.id);
                          },
                          child: Text(
                            "Sign in ",
                            style: TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              ),
            ),
    );
    ;
  }
}
