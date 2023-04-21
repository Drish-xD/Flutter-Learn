import 'package:flutter/material.dart';
import 'package:forms/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login Form",
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
