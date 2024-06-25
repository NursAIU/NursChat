import 'package:flutter/material.dart';
import '../models/conversationModel.dart';
import 'chatScreen.dart';

class ConversationsScreen extends StatelessWidget {
  final List<Conversation> conversations;

  ConversationsScreen({required this.conversations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список диалогов'),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(conversations[index].userAvatarUrl),
            ),
            title: Text(conversations[index].userName),
            subtitle: Text(conversations[index].messages.isNotEmpty
                ? conversations[index].messages.last.messageContent
                : 'No messages'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(conversation: conversations[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
