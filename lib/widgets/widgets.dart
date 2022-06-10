import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
Widget kAppBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: const <TextSpan>[
        TextSpan(
          text: 'Quiz ',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        TextSpan(
          text: 'Maker',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      ],
    ),
  );
}

Widget kRoundedButton(BuildContext context, String label) {
  String _label = label;
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Text(
      _label,
      style: TextStyle(fontSize: 20),
    ),
  );
}
