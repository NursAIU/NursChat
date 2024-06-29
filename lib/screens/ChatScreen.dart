import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/screens/auth/AuthService.dart';
import 'package:nurschat/screens/chat/ChatService.dart';
import 'package:nurschat/widgets/ChatBubble.dart';
import 'package:nurschat/widgets/MyTextField.dart';

class ChatScreen extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  ChatScreen(
      {super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDowm(),
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () => scrollDowm());
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  void scrollDowm() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);

      _messageController.clear();
    }

    scrollDowm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: nWhiteColor,
        automaticallyImplyLeading: false,
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessage(widget.receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }

          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 5),
      child: Row(
        children: [
          IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: sendMessage,
              icon: Icon(Icons.file_present_rounded)),
          IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: sendMessage,
              icon: Icon(Icons.keyboard_voice_rounded)),
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
              focusNode: myFocusNode,
            ),
          ),
          IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: sendMessage,
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
