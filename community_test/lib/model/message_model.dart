class MessageModel {
  final String id;
  final String message;

  MessageModel({this.id = '', this.message = ''});

  factory MessageModel.fromMap(
      {required String id, required Map<String, dynamic> map}) {
    return MessageModel(
      id: id,
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['message'] = message;
    return data;
  }
}
