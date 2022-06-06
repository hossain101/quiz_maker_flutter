import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/services/auth.dart';
import 'package:quiz_maker_flutter/views/signup.dart';
import 'package:quiz_maker_flutter/widgets/widgets.dart';

import 'home.dart';

// ignore_for_file: prefer_const_constructors
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static String id = 'signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Auth authService = new Auth();
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService.signInEmailAndPassword(email, password);

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacementNamed(context, Home.id);
    }
  }

  late bool isLoading = false;

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
      body: isLoading
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Spacer(),
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
                        signIn();
                      },
                      child: kRoundedButton(context, 'Sign-In'),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, SignUp.id);
                          },
                          child: Text(
                            "Sign up ",
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
  }
}
