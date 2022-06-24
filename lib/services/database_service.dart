import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_green_whale/model/user_data.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final  String uid;
  DatabaseService({required this.uid});
  String? name;

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference users = firebaseFirestore.collection("users");

    get getUser {
    return firebaseFirestore.collection('users').doc(uid).withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromMap(snapshot.data()!),
        toFirestore: (user, _) => user.toMap(),
      );
  }





  addUser(String name, String email, String mobileNumber) async {
    return await users.doc("abc").set(
          ({'phone': mobileNumber, 'email': email, 'name': name}),
        );
  }
}
