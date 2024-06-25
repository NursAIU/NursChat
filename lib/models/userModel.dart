// models/user.dart
import 'dart:ui';

class User {
  final String id;
  final String name;
  final String avatarUrl;
  final Color color;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.color,
  });
}
