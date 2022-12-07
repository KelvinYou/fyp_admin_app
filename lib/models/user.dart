import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String uid;
  final String username;
  final String fullname;
  final String phoneNumber;
  final String email;
  final bool isEmailVerified;
  final String icNumber;
  final bool isIcVerified;
  final String photoUrl;
  final String description;
  final Map<String, dynamic> language;
  final double rating;
  final int rateNumber;
  final int totalDone;
  final String grade;

  const User(
      {required this.uid,
        required this.username,
        required this.fullname,
        required this.phoneNumber,
        required this.email,
        required this.isEmailVerified,
        required this.icNumber,
        required this.isIcVerified,
        required this.photoUrl,
        required this.description,
        required this.language,
        required this.rating,
        required this.rateNumber,
        required this.totalDone,
        required this.grade,});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      username: snapshot["username"],
      fullname: snapshot["fullname"],
      phoneNumber: snapshot["phoneNumber"],
      email: snapshot["email"],
      isEmailVerified: snapshot["isEmailVerified"],
      icNumber: snapshot["icNumber"],
      isIcVerified: snapshot["isIcVerified"],
      photoUrl: snapshot["photoUrl"],
      description: snapshot["description"],
      language: snapshot["language"],
      rating: snapshot["rating"],
      rateNumber: snapshot["rateNumber"],
      totalDone: snapshot["totalDone"],
      grade: snapshot["grade"],
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "fullname": fullname,
    "phoneNumber": phoneNumber,
    "email": email,
    "isEmailVerified": isEmailVerified,
    "icNumber": icNumber,
    "isIcVerified": isIcVerified,
    "photoUrl": photoUrl,
    "description": description,
    "language": language,
    "rating": rating,
    "rateNumber": rateNumber,
    "totalDone": totalDone,
    "grade": grade,
  };
}
