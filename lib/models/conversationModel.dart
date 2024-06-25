import 'messageModel.dart';

class Conversation {
  final String userId;
  final String userName;
  final String userAvatarUrl;
  final List<Message> messages;

  Conversation({
    required this.userId,
    required this.userName,
    required this.userAvatarUrl,
    required this.messages,
  });
}
