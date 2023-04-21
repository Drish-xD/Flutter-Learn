import 'package:flutter/material.dart';
import 'package:photos/models/image_model.dart';

class ImageCard extends StatelessWidget {
  final ImageModel img;
  const ImageCard({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blueAccent,
          )),
      child: Column(
        children: [
          Image.network(
            img.url,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            img.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
