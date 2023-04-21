class ImageModel {
  final String id;
  final String title;
  final String url;

  const ImageModel({required this.id, required this.title, required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageModel(
      id: parsedJson['id'],
      title: parsedJson['author'],
      url: parsedJson['download_url'],
    );
  }
}
