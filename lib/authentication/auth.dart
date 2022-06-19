import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth firebaseAuth;
  Auth({
    required this.firebaseAuth,
  });

  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  get uid => firebaseAuth.currentUser!.uid;

  createUser(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  singOut() {
    firebaseAuth.signOut();
  }
}
