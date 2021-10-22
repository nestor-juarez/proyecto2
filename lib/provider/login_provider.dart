import 'package:sistema_experto_pg2/model/session_model.dart';
import 'package:sistema_experto_pg2/repository/db_manager.dart';
import 'package:sqflite/sqlite_api.dart';

class LoginProvider {
  LoginProvider._privateConstructor();

  static final LoginProvider shared = LoginProvider._privateConstructor();

  Future<int> save(Session session) async {
    Database dbManger = await DbManager().db;

    return dbManger.insert("session", session.toDatabase());
  }

  Future<int> deleteSession() async {
    Database dbManager = await DbManager().db;
    var currentSession = await LoginProvider.shared.me();

    int query = await dbManager
        .delete("session", where: "user_id = ?", whereArgs: [currentSession.employeId]);

    return query;
  }

  Future<Session> me() async {
    Database dbManager = await DbManager().db;

    final List<Map<String, dynamic>> result = await dbManager.query("session");

    return Session.fromDatabase(result[0]);
  }

  Future<bool> existSession() async {
    try {
      Database dbManger = await DbManager().db;
      final List<Map<String, dynamic>> result = await dbManger.query("session");

      return result.isNotEmpty;
    } catch (error) {
      return false;
    }
  }

  Future<String> getToken() async {
    try {
      Database dbManger = await DbManager().db;
      final List<Map<String, dynamic>> result = await dbManger.query("session");

      return result.isNotEmpty ? result[0]["token"] : null;
    } catch (error) {
      return "";
    }
  }
}
