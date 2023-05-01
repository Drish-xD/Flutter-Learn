class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  const ItemModel({
    required this.id,
    required this.deleted,
    required this.type,
    required this.by,
    required this.time,
    required this.text,
    required this.dead,
    required this.parent,
    required this.kids,
    required this.score,
    required this.title,
    required this.descendants,
    required this.url,
  });

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    return ItemModel(
      id: parsedJson['id'],
      deleted: parsedJson['deleted'],
      type: parsedJson['type'],
      by: parsedJson['by'],
      time: parsedJson['time'],
      text: parsedJson['text'],
      dead: parsedJson['dead'],
      parent: parsedJson['parent'],
      kids: parsedJson['kids'],
      url: parsedJson['url'],
      score: parsedJson['score'],
      title: parsedJson['title'],
      descendants: parsedJson['descendants'],
    );
  }
}
