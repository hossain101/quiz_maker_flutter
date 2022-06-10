import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/services/database.dart';
import 'package:quiz_maker_flutter/views/add_questions.dart';
import 'package:quiz_maker_flutter/widgets/widgets.dart';
import 'package:random_string/random_string.dart';
// ignore_for_file: prefer_const_constructors

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);
  static String id = 'create_quiz';

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

//This is the class where most of the work will be done

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();

  late String quizImageURL = '',
      quizTitle = '',
      quizDescription = '',
      quizId = '';

  DatabaseService databaseService = DatabaseService();

  bool _isLoading = false;

  createQuizDataToDatabase() async {
    if (_formKey.currentState!.validate()) {
      quizId = randomAlphaNumeric(5).toString();
      Map<String, dynamic> quizData = {
        'quizId': quizId,
        'quizImageURL': quizImageURL,
        'quizTitle': quizTitle,
        'quizDescription': quizDescription,
      };

      setState(() {
        _isLoading = true;
      });

      await databaseService.addQuizData(quizData, quizId).then((val) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacementNamed(context, AddQuestions.id);
        });
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    //Quiz Image URL
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty ? 'Enter Image URL' : null;
                      },
                      decoration: InputDecoration(hintText: 'Quiz Image URL'),
                      onChanged: (val) {
                        quizImageURL = val;
                      },
                    ),

                    SizedBox(
                      height: 6.0,
                    ),
                    //Quiz Title
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty ? 'Enter Quiz Title' : null;
                      },
                      decoration: InputDecoration(hintText: 'Quiz Title'),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
//Quiz Description
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty ? 'Enter Quiz Description' : null;
                      },
                      decoration: InputDecoration(hintText: 'Quiz Description'),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Spacer(),

                    GestureDetector(
                        onTap: () {
                          createQuizDataToDatabase();
                        },
                        child: kRoundedButton(context, 'Create Quiz')),
                    SizedBox(
                      height: 80.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
