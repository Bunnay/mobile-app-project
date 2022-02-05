import 'package:my_app/database/db.dart';
import 'package:my_app/models/task.dart';

class TaskProvider extends DB {
  static final TaskProvider instance = TaskProvider._init();
  TaskProvider._init();

  Future insert(Task task) async {
    task.id = await (await db).insert(TaskTable.name, task.toMap());
    return task;
  }

  Future getAllTasks() async {
    List<Map<String, Object?>> result = await (await db).query(TaskTable.name,
        where: "${TaskTable.checked} = ?", whereArgs: [0]);
    return result.map((json) => Task.fromMap(json)).toList();
  }

  Future getCompleteTasks() async {
    List<Map<String, Object?>> result = await (await db).query(TaskTable.name,
        where: "${TaskTable.checked} = ?", whereArgs: [1]);
    return result.map((json) => Task.fromMap(json)).toList();
  }

  Future getTasksByCategoryId(int id ) async {
    List<Map<String, Object?>> result = await (await db).query(TaskTable.name,
        where: "${TaskTable.category_id} = ? AND ${TaskTable.checked} = ?", whereArgs: [id, 0]);
    return result.map((json) => Task.fromMap(json)).toList();
  }

    Future getCompleteTasksByCategoryId(int id ) async {
    List<Map<String, Object?>> result = await (await db).query(TaskTable.name,
        where: "${TaskTable.category_id} = ? AND ${TaskTable.checked} = ?", whereArgs: [id, 1]);
    return result.map((json) => Task.fromMap(json)).toList();
  }

  Future<int> delete(int id) async {
    return await (await db)
        .delete(TaskTable.name, where: '${TaskTable.id} = ?', whereArgs: [id]);
  }

  Future<int> update(Task task) async {
    return await (await db).update(TaskTable.name, task.toMap(),
        where: '${TaskTable.id} = ?', whereArgs: [task.id]);
  }

  Future searchTask(String title) async {
    List<Map<String, Object?>> result = await (await db).query(TaskTable.name,
        where: "${TaskTable.title} like ?", whereArgs: ['%$title%']);
    return result.map((json) => Task.fromMap(json)).toList();
  }

  Future close() async => (await db).close();
}
