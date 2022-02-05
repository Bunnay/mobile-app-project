import 'package:my_app/database/db.dart';
import 'package:my_app/models/category.dart';

class CategoryProvider extends DB {
  static final CategoryProvider instance = CategoryProvider._init();
  CategoryProvider._init();

  Future insert(Category category) async {
    category.id =
        await (await db).insert(CategoryTable.tableName, category.toMap());
    return category;
  }

  Future getAllCategories() async {
    final _db = await db;
    List<Map<String, Object?>> result = await _db.query(CategoryTable.tableName,
        orderBy: '${CategoryTable.id} desc');
    return result.map((json) => Category.fromMap(json)).toList();
  }

  Future<int> delete(int id) async {
    return await (await db).delete(CategoryTable.tableName,
        where: '${CategoryTable.id} = ?', whereArgs: [id]);
  }

  Future<int> update(Category category) async {
    return await (await db).update(CategoryTable.tableName, category.toMap(),
        where: '${CategoryTable.id} = ?', whereArgs: [category.id]);
  }

  Future close() async => (await db).close();
}