import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDatabase {
  static const String _databaseName = 'musaeid.db';
  static const int _databaseVersion = 1;
  static const String _tableName = 'orderTable';

  static Database? _database;

  /// Initialize the database
  static Future<void> initDatabase() async {
    if (_database != null) return;

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            json TEXT NOT NULL
          )
        ''');
      },
    );
  }

  /// Save object in the database
  static Future<void> saveObject<T>(
      String key,
      T object,
      Map<String, dynamic> Function(T) toJson,
      ) async {
    await initDatabase();

    String jsonString = jsonEncode(toJson(object));
    await _database?.insert(
      _tableName,
      {'id': key, 'json': jsonString},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("saveObject done");
  }

  /// Retrieve object from the database
  static Future<T?> getObject<T>(
      String key,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    await initDatabase();

    final List<Map<String, dynamic>> result = await _database!.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [key],
    );

    if (result.isEmpty) return null;

    String jsonString = result.first['json'] as String;
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    print("getObject done");
    return fromJson(jsonMap);
  }

  /// Remove object from the database
  static Future<void> removeObject(String key) async {
    await initDatabase();

    await _database?.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [key],
    );
  }

  /// Close the database
  static Future<void> closeDatabase() async {
    await _database?.close();
    _database = null;
  }
}
