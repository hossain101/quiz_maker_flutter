import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_maker_flutter/models/fire_base_user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FireBaseUser? _userFromFirebaseUser(User user) {
    return user != null ? FireBaseUser(userId: user.uid) : null;
  }

  Future<FireBaseUser?> signInEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential _firebaseUserCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = _firebaseUserCredential.user;

      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential _firebaseUserCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = _firebaseUserCredential.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
