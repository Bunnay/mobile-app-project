import 'package:my_app/database/db.dart';
import 'package:my_app/models/note.dart';

class NoteProvider extends DB {
  static final NoteProvider instance = NoteProvider._init();
  NoteProvider._init();

  Future insert(Note note) async {
    note.id = await (await db).insert(NoteTable.name, note.toMap());
    return note;
  }

  Future getAllNotes() async {
    final _db = await db;
    List<Map<String, Object?>> result =
        await _db.query(NoteTable.name, orderBy: '${NoteTable.id} desc');
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future<int> delete(int id) async {
    return await (await db)
        .delete(NoteTable.name, where: '${NoteTable.id} = ?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    return await (await db).update(NoteTable.name, note.toMap(),
        where: '${NoteTable.id} = ?', whereArgs: [note.id]);
  }

  Future searchNote(String title) async {
    List<Map<String, Object?>> result = await (await db).query(NoteTable.name,
        where: "${NoteTable.title} like ?", whereArgs: ['%$title%']);
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future close() async => (await db).close();
}