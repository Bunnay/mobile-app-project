import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          headerScreen,
          const SizedBox(
          height: 10,
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPrimary: Colors.blueAccent,
                    primary: Colors.lightBlue[50]),
                child: Row(children: const[
                 Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.lightBlue,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.lightBlue,
                    ),
                  )
                ],
                ),
          ),
          ],),
        ],
      ),
    );
  }
}

Widget get headerScreen {
  return SizedBox(
    child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Stack(
          children: [
            Badge(
              badgeColor: Colors.lightBlue,
              animationDuration: const Duration(milliseconds: 500),
              position: BadgePosition.bottomEnd(bottom: 1, end: 5),
              badgeContent: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              toAnimate: true,
              child: Image.asset(
                'lib/images/profile.png',
                width: 120,
                height: 120,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bunnay Mao',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

