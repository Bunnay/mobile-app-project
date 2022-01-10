import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:my_app/tasks/create.dart';

void main() {
  runApp(const Task());
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
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
          child: search,
          margin: const EdgeInsets.only(bottom: 5),
        ),
        allCategories,
        Expanded(
          child: allTasks,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomModal(context);
        },
        tooltip: 'Create Task',
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.article_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget get allCategories {
  return Container(
      margin: const EdgeInsets.all(10),
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categories('All', active: true),
          categories('Study'),
          categories('Work'),
          categories('Personal'),
          categories('Birthday'),
          categories('Wishlist'),
        ],
      ));
}

Widget categories(String text, {bool active = false}) {
  return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: active ? Colors.lightBlue : Colors.lightBlue[50],
          onPrimary: Colors.blueAccent,
          shadowColor: Colors.grey[50],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: active ? Colors.white : Colors.lightBlue)),
      ));
}

class Boolean {}

Widget get allTasks {
  return ListView(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: const Text('Today',
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      taskScreenBody('Homework ENGL 200'),
      taskScreenBody('Database Assignment'),
      taskScreenBody('Security Exam at 22'),
      taskScreenBody('Quiz Math CS311'),
      taskScreenBody('Project meeting at 9 today'),
      taskScreenBody('Library Management'),
    ],
  );
}

Widget get search {
  return SizedBox(
      child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.grey[200],
                hintText: 'Search tasks',
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
              ),
            ),
          ])));
}

Widget taskScreenBody(String title) {
  bool value = false;
  return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.white,
            onPrimary: Colors.blueAccent,
            shadowColor: Colors.grey[50],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(children: [
            Row(
              children: [
                Checkbox(
                  value: value,
                  shape: const CircleBorder(),
                  splashRadius: 10,
                  activeColor: Colors.transparent,
                  checkColor: Colors.red,
                  onChanged: (value) {
                    void setState;
                    (() {
                      value = value;
                    });
                  },
                ),
                Expanded(
                    child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                )),
              ],
            ),
          ])));
}

_showBottomModal(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          height: 200,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: const Text(
                    "Create Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 10),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(
                              20.0, 10.0, 100.0, 10.0),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                          fillColor: Colors.grey[200],
                          hintText: 'Input new task here',
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                        ),
                      ),
                    )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.send,
                            size: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPrimary: Colors.blueAccent,
                              primary: Colors.lightBlue[50]),
                          child: const Text(
                            "Select Category",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.lightBlue,
                            ),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPrimary: Colors.blueAccent,
                              primary: Colors.lightBlue[50]),
                          child: const Icon(
                            Icons.notifications_active,
                            size: 20,
                            color: Colors.lightBlue,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPrimary: Colors.blueAccent,
                              primary: Colors.lightBlue[50]),
                          child: const Icon(
                            Icons.date_range,
                            size: 20,
                            color: Colors.lightBlue,
                          ),
                        )),

                  ],
                ),
              ],
            ),
          ),
        );
      });
}
