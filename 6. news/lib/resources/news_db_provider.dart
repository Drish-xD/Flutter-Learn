import 'dart:io';

import 'package:news/models/item_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDbProvider {
  late Database db;
  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'items.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("""
        Create Table Items (
          id INTEGER PRIMARY KEY,
          type TEXT,
          by TEXT,
          time INTERGER,
          text TEXT,
          parent INTEGER,
          kids BLOB,
          dead INTEGER,
          deleted INTEGER,
          url TEXT,
          score INTEGER,
          title TEXT,
          descendants INTEGER
        )""");
      },
    );
  }

  Future<ItemModel?> fetchItem({required int id}) async {
    final maps = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ItemModel.formDb(parsedJson: maps.first);
    }
    return null;
  }

  Future<int> addItems({required ItemModel item}) {
    return db.insert(
      'Items',
      item.toMapFromDb(),
    );
  }
}
