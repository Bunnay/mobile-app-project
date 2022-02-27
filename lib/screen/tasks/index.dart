import 'package:flutter/material.dart';
import 'package:my_app/components/search.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/provider/category_provider.dart';
import 'package:my_app/provider/task_provider.dart';
import 'package:my_app/screen/tasks/create_category.dart';
import 'package:my_app/screen/tasks/create_task.dart';
import 'package:my_app/screen/tasks/edit_task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<TaskScreen> {
  List<Task> tasks = [];
  List<Task> completeTasks = [];
  List<Category> categories = [];
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var category_id;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var task_id;
  // ignore: non_constant_identifier_names
  var category_states = [];
  var changeActive = true;
  final _searchController = TextEditingController();
  final _titleController = TextEditingController();
  final _categoryNameController = TextEditingController();
  final Future<String> _delay = Future<String>.delayed(
    const Duration(milliseconds: 400),
    () => 'It may take a while!',
  );

  @override
  initState() {
    super.initState();
    getTasks();
    getCategories();
    getMyCompleteTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _delay,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Tasks',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: Column(children: [
                Container(
                  child: search(_searchController, taskSearch),
                  margin: const EdgeInsets.only(bottom: 5),
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 38,
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              changeActive ? Colors.lightBlue : Colors.blue[50],
                          elevation: 0,
                          shadowColor: Colors.grey[50],
                          onPrimary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Text('All',
                            style: TextStyle(
                                color: changeActive
                                    ? Colors.white
                                    : Colors.lightBlue,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          var _states = category_states;
                          for (var i = 0; i < _states.length; i++) {
                            _states[i] = false;
                          }
                          setState(() {
                            category_states = _states;
                            changeActive = true;
                          });
                          getTasks();
                          getMyCompleteTasks();
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: allCategories,
                      ),
                    ),
                    Container(
                      width: 40,
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[50],
                          elevation: 0,
                          onPrimary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.grey[50],
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const Icon(Icons.add,
                            size: 20, color: Colors.lightBlue),
                        onPressed: () => openDialog(
                            context, _categoryNameController, createCategory),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: allTasks,
                      ),
                    ],
                  ),
                ),
              ]),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _titleController.text = "";
                  showCreateBottomModal(context, _titleController, createTask,
                      (value) => {category_id = value});
                },
                tooltip: 'Create Task',
                backgroundColor: Colors.lightBlue,
                child: const Icon(
                  Icons.article_rounded,
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'It may take a while!',
              ),
            ],
          );
        });
  }

  Future<void> getTasks() async {
    List<Task> _tasks = await TaskProvider.instance.getAllTasks();
    setState(() {
      tasks = _tasks;
    });
  }

  Future<void> getMyCompleteTasks() async {
    List<Task> _completeTasks = await TaskProvider.instance.getCompleteTasks();
    setState(() {
      completeTasks = _completeTasks;
    });
  }

  Future<void> getCategories() async {
    List<Category> _categories =
        await CategoryProvider.instance.getAllCategories();
    setState(() {
      categories = _categories;
      category_states = List.generate(_categories.length, (index) => false);
    });
  }

  // ignore: non_constant_identifier_names
  Future<void> getTasksByCategory(_category_id) async {
    List<Task> _tasks =
        await TaskProvider.instance.getTasksByCategoryId(_category_id);
    setState(() {
      tasks = _tasks;
      // category_id = _category_id;
    });
  }

// ignore: non_constant_identifier_names
  Future<void> getCompleteTasksByCategory(_category_id) async {
    List<Task> _completeTasks =
        await TaskProvider.instance.getCompleteTasksByCategoryId(_category_id);
    setState(() {
      completeTasks = _completeTasks;
      // category_id = _category_id;
    });
  }

  Widget get allCategories {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 47,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.asMap().entries.map((e) {
          return displayCategories(e.value, e.key);
        }).toList(),
      ),
    );
  }

  Widget displayCategories(Category category, int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: category_states[index] ? Colors.lightBlue : Colors.blue[50],
          onPrimary: Colors.blueAccent,
          shadowColor: Colors.grey[50],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          getTasksByCategory(category.id);
          getCompleteTasksByCategory(category.id);
          var _states = category_states;
          for (var i = 0; i < _states.length; i++) {
            _states[i] = i == index;
          }
          setState(() {
            category_states = _states;
            changeActive = false;
          });
        },
        onLongPress: () {
          openDialogDeleteCategory(category.id);
        },
        child: Text(
            category.name
                .toLowerCase()
                .split(" ")
                .map((word) =>
                    word[0].toUpperCase() + word.substring(1, word.length))
                .join(" "),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:
                    category_states[index] ? Colors.white : Colors.lightBlue)),
      ),
    );
  }

  Widget get allTasks {
    if (tasks.isEmpty && completeTasks.isEmpty) {
      return Image.asset(
        'lib/images/no-data.jpg',
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: tasks.map(
                (task) {
                  return taskScreenBody(task);
                },
              ).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            completeTasks.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Completed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.lightBlue,
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: completeTasks.map(
                (task) {
                  return taskScreenBody(task);
                },
              ).toList(),
            ),
          ],
        ),
      );
    }
  }

  Widget get allCompleteTasks {
    return ListView(
        children: completeTasks.map((task) {
      return taskScreenBody(task);
    }).toList());
  }

  Widget taskScreenBody(Task task) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: ElevatedButton(
        onPressed: () {
          _titleController.text = task.title;
          category_id = task.category_id;
          task_id = task.id;
          showEditBottomModal(context, _titleController, editTask);
        },
        onLongPress: () {
          openDialogDeleteTask(task.id);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          primary: Colors.grey[100],
          onPrimary: Colors.blueAccent,
          shadowColor: Colors.grey[50],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: Colors.grey.shade50),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: task.checked,
                  shape: const CircleBorder(),
                  splashRadius: 20,
                  activeColor: Colors.transparent,
                  checkColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      task.checked = !task.checked;
                      Task myTask = Task(
                        title: task.title,
                        id: task.id,
                        category_id: task.category_id,
                        checked: task.checked,
                      );
                      TaskProvider.instance.update(myTask);
                      for (var i = 0; i < category_states.length; i++) {
                        category_states[i] = false;
                      }
                      changeActive = true;
                      getMyCompleteTasks();
                      getTasks();
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      decoration: task.checked == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createTask() async {
    Task task = Task(
      title: _titleController.text,
      category_id: category_id,
      checked: false,
    );
    TaskProvider.instance.insert(task);
    Navigator.pop(context, task);
    _titleController.text = '';
    category_id = null;
    for (var i = 0; i < category_states.length; i++) {
      category_states[i] = false;
    }
    changeActive = true;
    getTasks();
    getMyCompleteTasks();
  }

  Future<void> editTask() async {
    Task task = Task(
      title: _titleController.text,
      category_id: category_id,
      checked: false,
      id: task_id,
    );
    TaskProvider.instance.update(task);
    Navigator.pop(context, task);
    _titleController.text = '';
    category_id = null;
    task_id = null;
    for (var i = 0; i < category_states.length; i++) {
      category_states[i] = false;
    }
    changeActive = true;
    getTasks();
    getMyCompleteTasks();
  }

  Future openDialogDeleteCategory(id) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirmation',
              style: TextStyle(
                color: Colors.red,
              )),
          content: const Text(
            'Are you sure want to delete?',
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  deleteCategory(id);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.white,
                  elevation: 0,
                ),
                child: const Text('Delete',
                    style: TextStyle(
                      color: Colors.red,
                    ))),
          ],
        ),
      );

  Future openDialogDeleteTask(id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Confirmation',
                style: TextStyle(
                  color: Colors.red,
                )),
            content: const Text(
              'Are you sure want to delete?',
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    deleteTask(id);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text('Delete',
                      style: TextStyle(
                        color: Colors.red,
                      ))),
            ],
          ));

  Future<void> deleteCategory(id) async {
    bool success = false;
    String? message;
    try {
      CategoryProvider.instance.delete(id);
      message = 'Deleted successfully';
      success = true;
    } catch (_) {
      message = 'Error deleted';
      success = false;
    } finally {
      final snackBar = SnackBar(
        content: Text(
          message!,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: success ? Colors.lightBlue : Colors.redAccent,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      getCategories();
    }
  }

  Future<void> deleteTask(id) async {
    bool success = false;
    String? message;
    try {
      TaskProvider.instance.delete(id);
      message = 'Deleted successfully';
      success = true;
    } catch (_) {
      message = 'Error deleted';
      success = false;
    } finally {
      final snackBar = SnackBar(
        content: Text(
          message!,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: success ? Colors.lightBlue : Colors.redAccent,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      getTasks();
      getMyCompleteTasks();
    }
  }

  Future<void> createCategory() async {
    bool success = false;
    String? message;
    Category category = Category(
      name: _categoryNameController.text,
    );
    try {
      for (var i = 0; i < categories.length; i++) {
        if (categories[i].name.toLowerCase() ==
            _categoryNameController.text.toLowerCase()) {
          success = false;
          message = "You cannot create category with the same name!";
          throw Exception();
        }
      }

      if (_categoryNameController.text != '') {
        CategoryProvider.instance.insert(category);
        success = true;
        message = "Created Successfully!";
      } else {
        success = false;
        message = "Name is required!";
      }
    } catch (e) {
      success = false;
    } finally {
      final snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        content: Text(
          message!,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: success ? Colors.lightBlue : Colors.redAccent,
      );
      Navigator.pop(context, category);
      _categoryNameController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      getCategories();
    }
  }

  Future<void> taskSearch(value) async {
    if (value == '') {
      getTasks();
      getMyCompleteTasks();
    } else {
      List<Task> _tasks =
          await TaskProvider.instance.searchTask(_searchController.text);
      List<Task> _completeTasks = await TaskProvider.instance
          .searchCompleteTask(_searchController.text);
      setState(
        () {
          tasks = _tasks;
          completeTasks = _completeTasks;
          for (var i = 0; i < category_states.length; i++) {
            category_states[i] = false;
          }
          changeActive = true;
        },
      );
    }
  }
}
