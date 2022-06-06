import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/views/signin.dart';

import '../widgets/widgets.dart';
// ignore_for_file: prefer_const_constructors

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String id = 'signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String email, password, name;

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
      body: Form(
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

              kRoundedButton(context, 'Sign-Up'),
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
                          fontSize: 20.0, decoration: TextDecoration.underline),
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
