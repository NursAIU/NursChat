import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: nChatUserColor, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: nButtonColor, width: 1),
              ),
                child: Icon(Icons.person)),
            const SizedBox(width: 10),
            Text(text)],
        ),
      ),
    );
  }
}
