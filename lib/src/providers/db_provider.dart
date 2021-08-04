import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:turismosangolqui/src/models/favorite_element_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'TrackMedical.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE FisioElements(
          id  INTEGER PRIMARY KEY,
          name TEXT,          
          active BOOLEAN
        )      
      ''');
    });
  }

  Future<int> insert(FavoriteElement newElement) async {
    final db = await database;
    final newId = await db.insert('FisioElements', newElement.toJson());
    return newId;
  }

  Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('FisioElements');
    return result.isNotEmpty
        ? result.map((t) => FavoriteElement.fromJson(t)).toList()
        : [];
  }
}
