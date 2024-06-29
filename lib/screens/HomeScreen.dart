import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/text_string.dart';
import 'package:nurschat/screens/auth/AuthService.dart';
import 'package:nurschat/screens/chat/ChatService.dart';

import '../widgets/UserTile.dart';
import 'ChatScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      appBar: AppBar(
        backgroundColor: nWhiteColor,
        title: Text(nChats),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen(receiverEmail: userData["email"],)));
        });
  }
}
