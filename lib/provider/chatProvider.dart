import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/messageModel.dart';
import '../models/userModel.dart';

class ChatProvider extends ChangeNotifier {
  List<User> _users;
  List<Message> _messages;

  ChatProvider()
      : _users = [
    User(id: '1', name: 'Zhandos', avatarUrl: 'https://example.com/avatar1.png'),
    User(id: '2', name: 'Me', avatarUrl: 'https://example.com/avatar3.png'),
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
