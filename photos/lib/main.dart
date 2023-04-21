import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:photos/models/image_model.dart';
import 'package:photos/widgets/image_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    setState(() {
      counter++;
    });
    final res = await get(Uri.parse("https://picsum.photos/id/$counter/info"));
    final imageModel = ImageModel.fromJson(jsonDecode(res.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lets See Some Images"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add_a_photo_rounded),
        ),
        body: ImageList(images: images),
      ),
    );
  }
}
