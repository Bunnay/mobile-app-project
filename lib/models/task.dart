
class Task {
  int? id;
  String title;
  bool checked;
  // ignore: non_constant_identifier_names
  int? category_id;

  Task({
    this.id,
    this.title = '',
    this.checked = false,
    // ignore: non_constant_identifier_names
    this.category_id,
  });

  Map<String, Object?> toMap() {
    if (id != null) {
      return <String, Object?>{
        TaskTable.id: id,
        TaskTable.title: title,
        TaskTable.checked: checked ? 1 : 0,
        TaskTable.category_id: category_id,
      };
    }
    return {
      TaskTable.title: title,
      TaskTable.checked: checked ? 1 : 0,
      TaskTable.category_id: category_id,
    };
  }

  Task.fromMap(Map map)
      : id = map[TaskTable.id],
        title = map[TaskTable.title],
        checked = map[TaskTable.checked] == 1 ? true : false,
        category_id = map[TaskTable.category_id];
}

class TaskTable {
  static const String name = 'tasks';
  static const String id = '_id';
  static const String title = 'title';
  static const String checked = 'checked';
  // ignore: constant_identifier_names
  static const String category_id = 'category_id';
}
