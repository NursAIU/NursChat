import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/size_string.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/messageModel.dart';
import '../models/userModel.dart';
import '../provider/chatProvider.dart';

class ChatScreen extends StatelessWidget {
  final User currentUser;
  final User chatUser;

  ChatScreen({
    required this.currentUser,
    required this.chatUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      appBar: AppBar(
        backgroundColor: nWhiteColor,
        title: Text(currentUser.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, chatProvider, _) {
                  List<Message> messages = chatProvider.messages
                      .where((message) =>
                          (message.senderId == currentUser.id &&
                              message.receiverId == chatUser.id) ||
                          (message.senderId == chatUser.id &&
                              message.receiverId == currentUser.id))
                      .toList();
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      Message message = messages[index];
                      bool isCurrentUser = message.senderId == currentUser.id;
                      return Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isCurrentUser
                                ? nChatUserColor
                                : nChatCurrentColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(nDefaultSize),
                                topRight: Radius.circular(nDefaultSize),
                                bottomLeft: isCurrentUser
                                    ? Radius.circular(nDefaultSize)
                                    : Radius.circular(nZeroSize),
                                bottomRight: isCurrentUser
                                    ? Radius.circular(nZeroSize)
                                    : Radius.circular(nDefaultSize)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.content,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                DateFormat.Hm().format(message.timestamp),
                                style: TextStyle(
                                    fontSize: 12, color: nGrey600Color),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            _buildMessageComposer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageComposer(BuildContext context) {
    TextEditingController _textController = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              textInputAction: TextInputAction.send,
              decoration:
                  InputDecoration.collapsed(hintText: 'Отправить сообщение...'),
              onSubmitted: (text) {
                _sendMessage(context, text);
                _textController.clear();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String text = _textController.text.trim();
              if (text.isNotEmpty) {
                _sendMessage(context, text);
                _textController.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context, String text) {
    Message newMessage = Message(
      id: UniqueKey().toString(),
      senderId: currentUser.id,
      receiverId: chatUser.id,
      content: text,
      timestamp: DateTime.now(),
    );

    Provider.of<ChatProvider>(context, listen: false).addMessage(newMessage);
  }
}
