import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import "package:news/resources/news_api_provider.dart";

void main() {
  // Test function for the topStories id function
  test(
    "FetchTopIds return a list of ids",
    () async {
      final newsApi = NewsApiProvider();
      newsApi.client = MockClient((request) async {
        return Response(jsonEncode([1, 2, 3, 4, 5, 8, 44, 45, 100]), 200);
      });
      final ids = await newsApi.fetchTopIds();

      expect(ids, [1, 2, 3, 4, 5, 8, 44, 45, 100]);
    },
  );

  // Test for the fetching of item data
  test(
    "FetchItems return a item model",
    () async {
      final newsApi = NewsApiProvider();
      newsApi.client = MockClient((request) async {
        return Response(jsonEncode({'id': 2}), 200);
      });

      final item = await newsApi.fetchItems(id: 2);

      expect(item, {'id': 2});
    },
  );
}
