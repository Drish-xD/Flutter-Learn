import 'package:news/models/item_model.dart';

import 'news_api_provider.dart';
import 'news_db_provider.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem({required int id}) async {
    var item = await dbProvider.fetchItem(id: id);
    if (item != null) {
      return item;
    }

    item = await apiProvider.fetchItems(id: id);

    dbProvider.addItems(item: item);

    return item;
  }
}
