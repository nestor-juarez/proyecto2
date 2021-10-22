
import 'package:sqflite/sqflite.dart';

class TableManager {
  TableManager._privateConstructor();

  static final TableManager shared = TableManager._privateConstructor();

  Future<void> session(Database db) async {
    const table = '''CREATE TABLE session
    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      lastname TEXT,
      email TEXT,
      employe_id TEXT
    )''';

    await db.execute(table);
  }
}