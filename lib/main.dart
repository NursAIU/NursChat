import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nurschat/firebase_options.dart';
import 'package:nurschat/screens/LoginOrRegister.dart';
import 'package:nurschat/screens/LoginScreen.dart';
import 'package:nurschat/screens/RegisterScreen.dart';
import 'package:nurschat/screens/auth/AuthGate.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
