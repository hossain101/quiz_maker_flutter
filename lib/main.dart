import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/views/add_questions.dart';
import 'package:quiz_maker_flutter/views/create_quiz.dart';
import 'package:quiz_maker_flutter/views/home.dart';
import 'package:quiz_maker_flutter/views/signin.dart';
import 'package:quiz_maker_flutter/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: Home.id,
      routes: {
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        Home.id: (context) => Home(),
        CreateQuiz.id: (context) => CreateQuiz(),
        AddQuestions.id: (context) => AddQuestions(),
      },
    );
  }
}
