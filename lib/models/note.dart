import 'package:flutter/material.dart';
import 'package:my_app/database/db.dart';

class Note {
  int? id;
  String title;
  String text;

  Note({
    this.id,
    this.title = '',
    this.text = '',
  });

  Map<String, Object?> toMap() {
    if (id != null) {
      return <String, Object?>{
        NoteTable.id: id,
        NoteTable.title: title,
        NoteTable.text: text,
      };
    }
    return {
      NoteTable.title: title,
      NoteTable.text: text,
    };
  }

  Note.fromMap(Map map)
      : id = map[NoteTable.id],
        title = map[NoteTable.title],
        text = map[NoteTable.text];
}

class NoteTable {
  static const String name = 'notes';
  static const String id = '_id';
  static const String title = 'title';
  static const String text = 'text';
}

class NoteProvider extends DB {
  static final NoteProvider instance = NoteProvider._init();
  NoteProvider._init();

  Future insert(Note note) async {
    note.id = await (await db).insert(NoteTable.name, note.toMap());
    return note;
  }

  Future getAllNotes() async {
    final _db = await db;
    List<Map<String, Object?>> result = await _db.query(NoteTable.name);
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future<int> delete(int id) async {
    return await (await db).delete(NoteTable.name, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    return await (await db).update(NoteTable.name, note.toMap(),
      where: 'id = ?', whereArgs: [note.id]);
  }

  Future close() async => (await db).close();
}
