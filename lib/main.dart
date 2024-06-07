import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:umla_project/view/Display_medicine.dart';
import 'package:umla_project/view/HomeScreen.dart';
import 'package:umla_project/view/firebase_options.dart';
import 'package:umla_project/view/SignInPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login page',
      debugShowCheckedModeBanner: false,
      home:  SignInPage(),
    );
  }
}
