import 'package:firebase_auth/firebase_auth.dart';
class AppUser {
  String uid;
  String name;
  String email;
  String weight;
  String height;
  String age;
  // Constructor
  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.age,
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
      weight:  '',
      height:  '',
      age:  '',
    );
  }
}
