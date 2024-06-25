import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/messageModel.dart';
import '../models/userModel.dart';

class ChatProvider extends ChangeNotifier {
  List<User> _users;
  List<Message> _messages;

  ChatProvider()
      : _users = [
    User(id: '1', name: 'Me', avatarUrl: 'https://sneg.top/uploads/posts/2023-06/1687990849_sneg-top-p-avatarka-siluet-muzhchini-vkontakte-10.jpg', color: nGreenColor,),
    User(id: '2', name: 'Zhandos', avatarUrl: 'https://sneg.top/uploads/posts/2023-06/1687990849_sneg-top-p-avatarka-siluet-muzhchini-vkontakte-10.jpg', color: nBlueColor),
  ],
        _messages = [] {
    loadMessagesFromPrefs();
  }

  List<User> get users => _users;

  List<Message> get messages => _messages;

  Future<void> addMessage(Message message) async {
    _messages.add(message);
    notifyListeners();
    await _saveMessagesToPrefs();
  }

  Future<void> _saveMessagesToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesJsonList = _messages.map((message) => message.toJson()).toList();
    await prefs.setStringList('messages', messagesJsonList);
  }

  Future<void> loadMessagesFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? messagesJsonList = prefs.getStringList('messages');
    if (messagesJsonList != null) {
      _messages = messagesJsonList.map((json) => Message.fromJson(json)).toList();
    }
    notifyListeners();
  }
}
