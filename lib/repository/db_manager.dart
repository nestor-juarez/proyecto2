import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'table_manager.dart';

Database? db;

class DbManager {
  static final DbManager _instance = new DbManager.internal();

  factory DbManager() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  DbManager.internal();

  databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>>? selectQueryResult,
        int? insertAndUpdateQueryResult,
        List<dynamic>? params]) {
    print(functionName);

    print(sql);
    if (params != null) {
      print(params);
    }

    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  initDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "proyecto2.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await TableManager.shared.session(db);
    await TableManager.shared.product(db);
  }
}