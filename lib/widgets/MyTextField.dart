import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/text_string.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: nTextFieldColor,
          filled: true,
          hintText: nEmailAddress,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: nTextFieldColor,
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: nTextFieldColor
              )
          ),

        ),
      ),
    );
  }
}
