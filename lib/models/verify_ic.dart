import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyIc {
  final String verifyIcId;
  final String ownerId;
  final String icFrontPic;
  final String icBackPic;
  final String icHoldPic;
  final String status;

  const VerifyIc(
      {required this.verifyIcId,
        required this.ownerId,
        required this.icFrontPic,
        required this.icBackPic,
        required this.icHoldPic,
        required this.status,
      });

  static VerifyIc fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return VerifyIc(
      verifyIcId: snapshot["verifyIcId"],
      ownerId: snapshot["ownerId"],
      icFrontPic: snapshot["icFrontPic"],
      icBackPic: snapshot["icBackPic"],
      icHoldPic: snapshot["icHoldPic"],
      status: snapshot["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "verifyIcId": verifyIcId,
    "ownerId": ownerId,
    "icFrontPic": icFrontPic,
    "icBackPic": icBackPic,
    "icHoldPic": icHoldPic,
    "status": status,
  };
}