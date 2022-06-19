import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference users = firebaseFirestore.collection("users");
  addUser(
      String name, String email, String password, String mobileNumber) async {
    return await users.add(
      ({'phone': mobileNumber, 'email': email, 'name': name}),
    );
  }
}
