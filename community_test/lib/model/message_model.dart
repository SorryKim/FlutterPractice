import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String message;
  final Timestamp sendDate;

  MessageModel({
    this.id = '',
    this.message = '',
    Timestamp? sendDate,
  }) : sendDate = sendDate ?? Timestamp(0, 0);

  factory MessageModel.fromMap(
      {required String id, required Map<String, dynamic> map}) {
    return MessageModel(
      id: id,
      message: map['message'] ?? '',
      sendDate: map['sendDate'] ?? Timestamp(0, 0),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['message'] = message;
    data['sendDate'] = sendDate;
    return data;
  }
}
