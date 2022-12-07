import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String messageId;
  final String chatroomId;
  final String fromId;
  final String content;
  final String type;
  final DateTime timestamp;

  const Message(
      {required this.messageId,
        required this.chatroomId,
        required this.fromId,
        required this.content,
        required this.type,
        required this.timestamp,
      });

  static Message fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Message(
      messageId: snapshot["messageId"],
      chatroomId: snapshot["chatroomId"],
      fromId: snapshot["fromId"],
      content: snapshot["content"],
      type: snapshot["type"],
      timestamp: snapshot["timestamp"],
    );
  }

  Map<String, dynamic> toJson() => {
    "messageId": messageId,
    "chatroomId": chatroomId,
    "fromId": fromId,
    "content": content,
    "type": type,
    "timestamp": timestamp,
  };
}