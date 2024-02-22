// ignore_for_file: nullable_type_in_catch_clause, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapid_task/models/authentication/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserModel> getUserDetails() async {
    final snap =
        await _firestore.collection('users').where('id' ,isEqualTo: _firebaseAuth.currentUser!.uid).get();
    return UserModel.fromSnap(snap.docs.first);
  }

  Future<UserModel?> signUpUser(
      String email, String password, String username) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {

        UserModel user = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          username: username,
        );
        await _firestore.collection('users').add(
              user.toJson(),
            );
        return user;

      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
