import 'package:flutter/material.dart';
import 'package:nurschat/screens/auth/AuthService.dart';

import '../consts/color_string.dart';
import '../consts/text_string.dart';
import '../widgets/MyButton.dart';
import '../widgets/MyTextField.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString())));
      }
    } else {
      showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("Error password")
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nRegisterWelcome,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MyTextField(
                    hintText: nEmailAddress,
                    obscureText: false,
                    controller: _emailController,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MyTextField(
                    hintText: nPassword,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MyTextField(
                    hintText: nConfirmPassword,
                    obscureText: true,
                    controller: _confirmController,
                  ),
                ),
                const SizedBox(height: 30),
                MyButton(
                  text: nRegisterText,
                  color: nWhiteColor,
                  fontSize: 16,
                  onTap: () => register(context),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(nHaveAnAcc),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        nHaveAnAccLogin,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
