import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String phone;
  final String email;

  User({
    required this.userName,
    required this.phone,
    required this.email,
  });

  factory User.fromFireStore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return User(
      userName: data?['name'] ?? "Guest",
      phone: data?['phone'] ?? '',
      email: data?['email'],
    );
  }

  User copyWith({
    String? userName,
    String? phone,
    String? email,
  }) {
    return User(
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'phone': phone});
    result.addAll({'email': email});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(userName: $userName, phone: $phone, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userName == userName &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode => userName.hashCode ^ phone.hashCode ^ email.hashCode;
}
