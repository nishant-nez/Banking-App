import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT,
      password TEXT
    )
    """);
    // Check if the users table is empty
    final count = sql.Sqflite.firstIntValue(
      await database.rawQuery('SELECT COUNT(*) FROM users'),
    );

    // Insert initial value if the table is empty
    if (count == 0) {
      await database.execute('''INSERT INTO users(name, email, password)
      VALUES('nishant', 'nishant@gmail.com', 'nishant')''');
    }
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('usersDB.db', version: 1, onCreate: (
      sql.Database database,
      int version,
    ) async {
      print('....creating database.....');
      await createTables(database);
    });
  }

  static Future<int> createItem(String name, String email, String password) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'email': email, 'password': password};
    final id = await db.insert(
      'users',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getEmail(String email) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "email = ?", whereArgs: [email], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getPassword(String password) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "password = ?", whereArgs: [password], limit: 1);
  }
}
