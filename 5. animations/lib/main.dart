import "package:animations/screens/home.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
        body: const Home(),
        appBar: AppBar(
          title: const Text("Animation"),
        ),
      ),
    );
  }
}
