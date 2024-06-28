import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/text_string.dart';
import 'package:nurschat/widgets/MyTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nLoginWelcome, style: Theme.of(context).textTheme.headlineLarge),
            MyTextField()
          ],
        ),
      ),
    );
  }
}















