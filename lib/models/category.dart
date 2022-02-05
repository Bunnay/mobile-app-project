
class Category {
  int? id;
  String name;

  Category({
    this.id,
    this.name = '',
  });

  Map<String, Object?> toMap() {
    if (id != null) {
      return <String, Object?>{
        CategoryTable.id: id,
        CategoryTable.name: name,
      };
    }
    return {
      CategoryTable.name: name,
    };
  }

  Category.fromMap(Map map)
      : id = map[CategoryTable.id],
        name = map[CategoryTable.name];
}

class CategoryTable {
  static const String tableName = 'categories';
  static const String id = '_id';
  static const String name = 'name';
}

