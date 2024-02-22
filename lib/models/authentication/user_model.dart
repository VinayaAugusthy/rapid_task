import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;


  UserModel({required this.id, required this.email, required this.username});

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "username": username,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot['username'],
      email: snapshot['email'],
      id: snapshot['id'],

    );
  }
}
