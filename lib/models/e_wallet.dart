import 'package:cloud_firestore/cloud_firestore.dart';

class EWallet {
  final String eWalletId;
  final String ownerId;
  final double balance;

  const EWallet(
      {required this.eWalletId,
        required this.ownerId,
        required this.balance,
      });

  static EWallet fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return EWallet(
      eWalletId: snapshot["eWalletId"],
      ownerId: snapshot["ownerId"],
      balance: snapshot["balance"],
    );
  }

  Map<String, dynamic> toJson() => {
    "eWalletId": eWalletId,
    "ownerId": ownerId,
    "balance": balance,
  };
}