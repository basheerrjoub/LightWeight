import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String uid;
  String name;
  String email;
  String gender;
  int weight;
  int height;
  int age;
  // Constructor
  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  // Factory constructor to create an AppUser instance from a Firebase User
  factory AppUser.fromFirebaseUser(User? firebaseUser) {
    if (firebaseUser == null) {
      throw ArgumentError('FirebaseUser cannot be null');
    }

    return AppUser(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      gender:  'male',
      weight:  80,
      height:  180,
      age:  20,
    );
  }

  @override
  String toString() {
    return 'AppUser { '
        'uid: $uid, '
        'name: $name, '
        'email: $email, '
        'gender: $gender, '
        'weight: $weight, '
        'height: $height, '
        'age: $age '
        '}';
  }
}
