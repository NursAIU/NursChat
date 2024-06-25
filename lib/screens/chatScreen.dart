import 'package:flutter/material.dart';
import '../models/conversationModel.dart';
import '../models/messageModel.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  ChatScreen({required this.conversation});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Message> _messages = []; // Список сообщений чата

  @override
  void initState() {
    super.initState();
    _messages = widget.conversation.messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conversation.userName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index].messageContent),
                  subtitle: Text(_messages[index].timestamp.toString()),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                // Обработка отправки изображений
              },
            ),
            title: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Введите сообщение...',
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String messageId = DateTime.now().millisecondsSinceEpoch.toString();
      Message newMessage = Message(
        messageId: messageId,
        senderId: 'current_user_id', // Замените на текущий ID пользователя
        messageContent: _controller.text,
        timestamp: DateTime.now(),
        conversationId: widget.conversation.userId, // Используем userId в качестве conversationId для демонстрации
      );
      setState(() {
        _messages.add(newMessage);
        _controller.clear();
      });

      // Эмуляция ответа от другого пользователя (для демонстрационных целей)
      _simulateIncomingMessage(newMessage);
    }
  }

  void _simulateIncomingMessage(Message sentMessage) {
    // Имитация ответа от другого пользователя через 3 секунды
    Future.delayed(Duration(seconds: 3), () {
      String responseMessageContent = 'Ответ на "${sentMessage.messageContent}"';
      String messageId = DateTime.now().millisecondsSinceEpoch.toString();
      Message responseMessage = Message(
        messageId: messageId,
        senderId: widget.conversation.userId,
        messageContent: responseMessageContent,
        timestamp: DateTime.now(),
        conversationId: widget.conversation.userId,
      );

      setState(() {
        _messages.add(responseMessage);
      });
    });
  }
}
