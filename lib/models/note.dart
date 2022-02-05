
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

