import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/views/home.dart';
import 'package:quiz_maker_flutter/views/signin.dart';
import 'package:quiz_maker_flutter/views/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Maker App for Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SignIn.id,
      routes: {
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        Home.id: (context) => Home(),
      },
    );
  }
}
