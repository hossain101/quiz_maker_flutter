import 'package:flutter/material.dart';
import 'package:quiz_maker_flutter/widgets/widgets.dart';

import 'create_quiz.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateQuiz.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
