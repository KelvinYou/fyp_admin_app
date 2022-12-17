import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionRecord {
  final String transactionId;
  final String transactionAmount;
  final String ownerId;
  final String receiveFrom;
  final String transferTo;
  final String transactionType;
  final String paymentDetails;
  final String paymentMethod;
  final double newWalletBalance;
  final DateTime dateTime;
  final String status;

  const TransactionRecord(
      {required this.transactionId,
        required this.transactionAmount,
        required this.ownerId,
        this.receiveFrom = "",
        this.transferTo = "",
        required this.transactionType,
        required this.paymentDetails,
        required this.paymentMethod,
        required this.newWalletBalance,
        required this.dateTime,
        required this.status,
      });

  static TransactionRecord fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TransactionRecord(
      transactionId: snapshot["transactionId"],
      transactionAmount: snapshot["transactionAmount"],
      ownerId: snapshot["ownerId"],
      receiveFrom: snapshot["receiveFrom"],
      transferTo: snapshot["transferTo"],
      transactionType: snapshot["transactionType"],
      paymentDetails: snapshot["paymentDetails"],
      paymentMethod: snapshot["paymentMethod"],
      newWalletBalance: snapshot["newWalletBalance"],
      dateTime: snapshot["dateTime"],
      status:snapshot["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
    "transactionAmount": transactionAmount,
    "ownerId": ownerId,
    "receiveFrom": receiveFrom,
    "transferTo": transferTo,
    "transactionType": transactionType,
    "paymentDetails": paymentDetails,
    "paymentMethod": paymentMethod,
    "newWalletBalance": newWalletBalance,
    "dateTime": dateTime,
    "status": status,
  };
}