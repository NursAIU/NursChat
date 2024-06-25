class Message {
  final String messageId;
  final String senderId;
  final String messageContent;
  final DateTime timestamp;
  final String conversationId;

  Message({
    required this.messageId,
    required this.senderId,
    required this.messageContent,
    required this.timestamp,
    required this.conversationId,
  });
}
