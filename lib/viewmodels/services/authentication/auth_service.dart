// ignore_for_file: nullable_type_in_catch_clause, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapid_task/models/authentication/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //  Future<String> signupUser({
  //   required String email,
  //   required String password,
  //   required String username,
  //   // required String bio,
  //   // required Uint8List file,
  // }) async {
  //   String res = "Some error has been occured";

  //   try {
  //     if (email.isNotEmpty ||
  //         password.isNotEmpty ||
  //         username.isNotEmpty ||
  //        ) {
  //       //Registering user

  //       UserCredential cred = await _auth.createUserWithEmailAndPassword(
  //           email: email, password: password);

  //       String photoUrl = await StorageMethods()
  //           .uploadImageToStorage('profilePics', file, false);

  //       UserModel user = user(
  //           email: email,
  //           uid: cred.user!.uid,
  //           photoUrl: photoUrl,
  //           username: username,
  //           bio: bio,
  //           followers: [],
  //           followings: []);

  //       await _firestore.collection('users').doc(cred.user!.uid).set(
  //             user.toJson(),
  //           );
  //       res = "Now you can login with credentials";
  //     }
  //   } catch (err) {
  //     res = err.toString();
  //   }

  //   return res;
  // }
  Future<UserModel?> signUpUser(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        //  userRef =
        //     _firestore.collection('users').doc(firebaseUser.uid);
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
        );
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
