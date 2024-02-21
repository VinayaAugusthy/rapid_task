import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.photoUrl,
  });
  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": id,
        "photoUrl": photoUrl,
        "username": username,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot['username'],
      email: snapshot['email'],
      id: snapshot['id'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
