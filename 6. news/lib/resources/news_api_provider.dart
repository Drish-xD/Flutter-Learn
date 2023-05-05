import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:news/models/item_model.dart';

const _baseURL = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider {
  Client client = Client();

// Fetch top stories Id
  Future<List<int>> fetchTopIds() async {
    final res = await client.get(
      Uri.parse("$_baseURL/topstories.json"),
    );
    final ids = jsonDecode(res.body);
    return ids.cast<int>();
  }

  // Fetch data of each story via the id from above
  Future<ItemModel> fetchItems({required int id}) async {
    final res = await client.get(
      Uri.parse("$_baseURL/item/$id.json"),
    );
    final parsedJson = jsonDecode(res.body);

    return parsedJson;
  }
}
