import 'package:flutter/material.dart';

void main() {
  runApp(const CreateTasks());
}

class CreateTasks extends StatefulWidget {
  const CreateTasks({ Key? key }) : super(key: key);

  @override
  _CreateTasksState createState() => _CreateTasksState();
}

class _CreateTasksState extends State<CreateTasks> {
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
        iconTheme:
            const IconThemeData(size: 10, color: Colors.lightBlue, opacity: 1),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const Text('Hi'),
    );
  }
}