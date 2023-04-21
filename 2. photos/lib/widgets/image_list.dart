import 'package:flutter/material.dart';
import 'package:photos/models/image_model.dart';
import 'package:photos/widgets/image_card.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return ImageCard(img: images[index]);
      },
    );
  }
}
