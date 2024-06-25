import 'package:flutter/material.dart';
import 'package:nurschat/provider/chatProvider.dart';
import 'package:nurschat/screens/chatScreen.dart';
import 'package:provider/provider.dart';

import 'models/userModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        title: 'Messenger App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserListScreen(),
      ),
    );
  }
}

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<ChatProvider>(context).users;

    return Scaffold(
      appBar: AppBar(
        title: Text('Список пользователей'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(user.name),
            onTap: () {
              User currentUser;
              User chatUser;
              if (user.id == '1') {
                currentUser = users[0]; // User1
                chatUser = users[1]; // User3
              } else {
                currentUser = users[1]; // User3
                chatUser = users[0]; // User1
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    currentUser: currentUser,
                    chatUser: chatUser,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
