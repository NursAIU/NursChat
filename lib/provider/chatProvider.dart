// providers/chat_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/messageModel.dart';
import '../models/userModel.dart';

class ChatProvider extends ChangeNotifier {
  List<User> _users;
  List<Message> _messages;

  ChatProvider()
      : _users = [
    User(id: '1', name: 'ME', avatarUrl: 'https://lh3.googleusercontent.com/a/AEdFTp5HqOslJkzw32yfygJl1A2wHyfkLU2MRkCcJ84j=s96-c'),
    User(id: '3', name: 'Zhandos', avatarUrl: 'https://lh3.googleusercontent.com/a/AEdFTp5HqOslJkzw32yfygJl1A2wHyfkLU2MRkCcJ84j=s96-c'),
  ],
        _messages = [] {
    loadMessagesFromPrefs();
  }

  List<User> get users => _users;

  List<Message> get messages => _messages;

  Future<void> addMessage(Message message) async {
    _messages.add(message);

    // Обновляем последнее сообщение у обоих пользователей
    User sender = _users.firstWhere((user) => user.id == message.senderId);
    User receiver = _users.firstWhere((user) => user.id == message.receiverId);

    sender.lastMessage = message;
    receiver.lastMessage = message;

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

      // Обновляем последние сообщения для каждого пользователя
      for (User user in _users) {
        List<Message> userMessages = _messages.where((message) =>
        message.senderId == user.id || message.receiverId == user.id).toList();
        if (userMessages.isNotEmpty) {
          user.lastMessage = userMessages.last;
        }
      }
    }
    notifyListeners();
  }
}
