import 'package:flutter/material.dart';

import '../consts/color_string.dart';
import '../consts/text_string.dart';
import '../widgets/MyButton.dart';
import '../widgets/MyTextField.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  RegisterScreen({super.key});

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nRegisterWelcome,
            style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 30),
            MyTextField(
                hintText: nEmailAddress,
                obscureText: false,
                controller: _emailController),
            const SizedBox(height: 10),
            MyTextField(
                hintText: nPassword,
                obscureText: true,
                controller: _passwordController),
            MyTextField(
                hintText: nPassword,
                obscureText: true,
                controller: _passwordController),
            const SizedBox(height: 30),
            MyButton(
                text: nRegisterText,
                color: nWhiteColor,
                fontSize: 16,
                onTap: register),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nNotAMember),
                const SizedBox(width: 5),
                Text(
                  nNotAMemberRegister,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
