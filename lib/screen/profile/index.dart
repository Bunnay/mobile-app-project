import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              'My Social Media',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          socialMedia,
          userInformation,
        ],
      ),
    );
  }
}

Widget get socialMedia {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey[50],
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/facebook.png'),
                    backgroundColor: Colors.white,
                    // child: Icon(Icons.facebook, color: Colors.blue, size: 36.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey[50],
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/youtube.png'),
                    // child: Icon(Icons.link, color: Colors.blue, size: 36.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Youtube',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey[50],
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/telegram.png'),
                    // child: Icon(Icons.facebook, color: Colors.blue, size: 36.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Telegram',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget get userInformation {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
        child: Text(
          'User Information',
          style: TextStyle(
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      userInfo('Full Name', Icons.person, 'Bunnay Mao'),
      userInfo('Email', Icons.email, "iloveyou@gmail.com"),
      userInfo('Phone Number', Icons.phone, '+855 12 12 421'),
      userInfo('Address', Icons.location_city, 'Phnom Penh'),
    ],
  );
}

Widget userInfo(String title, IconData icon, String info) {
  return Card(
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    elevation: 2,
    child: ListTile(
      onTap: () {},
      leading: ClipOval(
        child: Icon(icon, color: Colors.blue, size: 36.0),
      ),
      title: Text(info),
    ),
  );
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
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPrimary: Colors.blueAccent,
                  primary: Colors.lightBlue[50]),
              child: Row(
                children: const [
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
          ],
        ),
      ],
    ),
  );
}
