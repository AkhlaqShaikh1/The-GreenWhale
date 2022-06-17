import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_green_whale/services/database_service.dart';

class Auth extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  getUid() {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser!.uid;
    }
    return null;
  }

  //Todo : Get User Name and implement it.

  getUserName() {
    if (_firebaseAuth.currentUser != null) {
    }
    return null;
  }

  createUser(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    notifyListeners();
  }

  signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    notifyListeners();
  }

  singOut() {
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
