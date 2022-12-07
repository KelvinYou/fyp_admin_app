import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAccount {

  final String uid;
  final String username;
  final String email;

  const AdminAccount(
      {required this.uid,
        required this.username,
        required this.email,
      });

  static AdminAccount fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdminAccount(
      uid: snapshot["uid"],
      username: snapshot["username"],
      email: snapshot["email"],
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "email": email,
  };
}
