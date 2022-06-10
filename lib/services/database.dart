import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await _firebaseFirestoreInstance
        .collection('Quiz')
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
