
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        buildWelcome,
        Container(child: overview),
        allCategories,
        allTasks,
        buildNote,
      ]),
      // body: Container(
      //   child:
      // )
    );
  }
}


Widget get buildWelcome {
  return Container(
    padding: const EdgeInsets.only(top: 40, left: 20, bottom: 40),
    child: Column(
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Welcome, Bunnay!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              )),
        ),
        SizedBox(
          height: 7,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Have a nice day!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.lightBlue)),
        ),
      ],
    ),
  );
}

// Widget get allOverview {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Padding(
//         padding: EdgeInsets.only(left: 20, top: 10),
//         child: Text('Overview',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.lightBlue,
//             )),
//       ),
//       Container(
//           margin: const EdgeInsets.all(12),
//           height: 100,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               buildOverview('Notes', 10, Colors.lightBlue, 0.5),
//               buildOverview('Tasks', 20, Colors.amberAccent, 0.1),
//               buildOverview('Categories', 20, Colors.amberAccent, 0.1),
//             ],
//           ))
//     ],
//   );
// }

Widget get overview {
  return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      // crossAxisSpacing: 2,
      // mainAxisSpacing: 2,
      crossAxisCount: 2,
      children: <Widget>[
        buildOverview(
            'Notes', 10, Colors.red[50], Colors.lightBlue, 0.5, Icons.note),
        buildOverview('Tasks', 20, Colors.purple[50], Colors.amberAccent, 0.1,
            Icons.task),
        buildOverview('Categories', 20, Colors.green[50], Colors.amberAccent,
            0.1, Icons.category),
        buildOverview('Categories', 20, Colors.blue[50], Colors.amberAccent,
            0.1, Icons.category),
      ]);
}

Widget buildOverview(String name, int num, Color? bgColor, Color iconColor,
    double percent, IconData icon) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.white,
    padding: const EdgeInsets.all(10),
    shape: const CircleBorder(),
    elevation: 0,
  );
  return Container(
    // width: 150,
    // height: 50,
    margin: const EdgeInsets.all(6),
    child: Card(
        color: bgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: Icon(
                icon,
                size: 35,
                color: iconColor,
              ),
            ),
            Column(
              children: [
                Text(
                  num.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            )
          ],
        )),
  );
}

Widget get allCategories {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text('Categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            )),
      ),
      Container(
          margin: const EdgeInsets.all(12),
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildTask('Study', 10, Colors.lightBlue, 0.5),
              buildTask('Work', 20, Colors.amberAccent, 0.1),
              buildTask('Personal', 50, Colors.greenAccent, 0.7),
              buildTask('Birthday', 2, Colors.redAccent, 0.2),
              buildTask('Wishlist', 17, Colors.purpleAccent, 0.8),
            ],
          ))
    ],
  );
}

Widget buildTask(String name, int num, Color color, double percent) {
  return Container(
    width: 150,
    height: 80,
    margin: const EdgeInsets.all(6),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: Colors.white,
          onPrimary: Colors.blueAccent,
          shadowColor: Colors.grey[50],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$num Tasks',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            LinearPercentIndicator(
              width: 130.0,
              lineHeight: 15.0,
              percent: percent,
              progressColor: color,
              backgroundColor: Colors.grey[200],
              // center: Text(
              //   (percent * 100).toString() + '%',
              //   style: const TextStyle(
              //   fontSize: 10,
              //   fontWeight: FontWeight.bold,
              //   color: Colors.white,
              // ),
              // ),
            ),
          ],
        )),
  );
}

Widget get allTasks {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Today\'s Tasks',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ))),
      ),
      tasks('Homework ENGL 200'),
      tasks('Database Assignment'),
      tasks('Security Exam at 22'),
      tasks('Quiz Math CS311'),
      tasks('Project meeting at 9 today'),
      tasks('Library Management'),
    ],
  );
}

Widget tasks(String title) {
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
                    // void setState;
                    // (() {
                    //   value = value;
                    // });
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

Widget get buildNote {
  return Container();
}
