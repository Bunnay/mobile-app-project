import 'package:flutter/material.dart';
import 'package:my_app/home.dart';
import 'package:my_app/notes/index.dart';
import 'package:my_app/profile/profile.dart';
import 'package:my_app/tasks/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      color: Colors.grey[100],
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool value = false;
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = <Widget>[
    const Home(),
    const Note(),
    const Task(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _page.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color_rounded, size: 30),
            label: 'Note',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded, size: 30),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
