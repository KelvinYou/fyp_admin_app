import 'package:cloud_firestore/cloud_firestore.dart';

class TourLicence {
  final String licenceId;
  final String ownerId;
  final String licencePhotoUrl;
  final String status;

  const TourLicence(
      {required this.licenceId,
        required this.ownerId,
        required this.licencePhotoUrl,
        required this.status,
      });

  static TourLicence fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TourLicence(
      licenceId: snapshot["licenceId"],
      ownerId: snapshot["ownerId"],
      licencePhotoUrl: snapshot["licencePhotoUrl"],
      status: snapshot["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "licenceId": licenceId,
    "ownerId": ownerId,
    "licencePhotoUrl": licencePhotoUrl,
    "status": status,
  };
}