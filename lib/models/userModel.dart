import 'messageModel.dart';

class User {
  final String id;
  final String name;
  final String avatarUrl;
  Message? lastMessage;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.lastMessage,
  });
}
