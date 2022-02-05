import 'package:my_app/models/category.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? _db;

  Future<Database> get db async {
    return _db ?? await open('my_taskss.db');
  }

  Future open(String path) async {
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE
      ${NoteTable.name}
      (
        ${NoteTable.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
        ${NoteTable.title} TEXT NOT NULL,
        ${NoteTable.text} TEXT NOT NULL
      )
    ''');

    await db.execute('''
    CREATE TABLE
      ${TaskTable.name}
      (
        ${TaskTable.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskTable.title} TEXT NOT NULL,
        ${TaskTable.checked} BOOLEAN NOT NULL,
        ${TaskTable.category_id} INTEGER NULL
      )
    ''');

    await db.execute('''
    CREATE TABLE
      ${CategoryTable.tableName}
      (
        ${CategoryTable.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CategoryTable.name} TEXT NOT NULL,
        UNIQUE (${CategoryTable.name})
      )
    ''');
  }
}
