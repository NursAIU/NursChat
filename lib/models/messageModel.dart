import 'dart:convert';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  String toJson() => jsonEncode({
    'id': id,
    'senderId': senderId,
    'receiverId': receiverId,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
  });

  static Message fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Message(
      id: jsonMap['id'],
      senderId: jsonMap['senderId'],
      receiverId: jsonMap['receiverId'],
      content: jsonMap['content'],
      timestamp: DateTime.parse(jsonMap['timestamp']),
    );
  }
}