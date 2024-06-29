import 'package:flutter/material.dart';
import 'package:nurschat/consts/color_string.dart';
import 'package:nurschat/consts/text_string.dart';
import 'package:nurschat/screens/auth/AuthService.dart';
import 'package:nurschat/widgets/MyTextField.dart';

import '../widgets/MyButton.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginScreen({super.key, required this.onTap});

  void login(BuildContext context) async{
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    } catch (e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString())
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nLoginWelcome, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 26)),
            const SizedBox(height: 30),
            MyTextField(hintText: nEmailAddress, obscureText: false, controller: _emailController),
            const SizedBox(height: 10),
            MyTextField(hintText: nPassword, obscureText: true, controller: _passwordController),
            const SizedBox(height: 30),
            MyButton(text: nLoginText,color: nWhiteColor, fontSize: 16, onTap: () => login(context)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nNotAMember),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: onTap,
                  child: Text(nNotAMemberRegister,style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}















