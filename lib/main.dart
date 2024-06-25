// main.dart
import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/text_string.dart';
import 'package:nurschat/provider/chatProvider.dart';
import 'package:nurschat/screens/chatScreen.dart';
import 'package:provider/provider.dart';

import 'consts/size_string.dart';
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
        debugShowCheckedModeBanner: false,
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
      backgroundColor: nWhiteColor,
      appBar: AppBar(
        backgroundColor: nWhiteColor,
        toolbarHeight: 100,
        title: Text(nChats,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w300
        ),),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: xl, vertical: mm),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                  radius: 24,
                ),
                title: Text(user.name),
                subtitle: user.lastMessage != null
                    ? Text(
                  user.lastMessage!.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
                    : null,
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
              ),
          );
        },
      ),
    );
  }
}
