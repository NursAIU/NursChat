import 'package:flutter/material.dart';
import 'package:nurschat/screens/LoginScreen.dart';
import 'package:nurschat/screens/RegisterScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
