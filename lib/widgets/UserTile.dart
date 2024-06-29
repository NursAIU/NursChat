import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: nChatUserColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Icon(Icons.person),
            Text(text)
          ],
        ),
      ),
    );
  }
}
