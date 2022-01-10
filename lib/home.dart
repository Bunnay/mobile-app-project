import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        buildWelcome,
        buildOverview,
        buildTask,
        buildNote,
      ]),
    );
  }
}

Widget get buildWelcome {
  return Container(
    padding: const EdgeInsets.only(top: 40, left: 20, bottom: 40),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Welcome, Bunnay!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              )),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Have a nice day!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              )),
        ),
      ],
    ),
  );
}

Widget get buildOverview {
  return Container(
    padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
    child: Column(
      children: [
        const Padding(padding: EdgeInsets.only(left: 20)),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Overview',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              )),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.deepPurple[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text("20",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Center(
                              child: Text("All Tasks",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                  )),
            ),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.redAccent[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text("5",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Center(
                              child: Text("Pending",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                  )),
            ),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.teal[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                          alignment: Alignment.center,
                          child: Text("15",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Center(
                              child: Text("Completed",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                  )),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget get buildTask {
  bool value = false;
  return SizedBox(
      child: Card(
    margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 20),
    child: Container(
        margin: const EdgeInsets.only(left: 15, right: 12, top: 12),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Todo List",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                )),
            Row(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Today - ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tue 27 Aug",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                SizedBox(
                    child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          shape: const CircleBorder(),
                          splashRadius: 20,
                          activeColor: Colors.transparent,
                          checkColor: Colors.red,
                          onChanged: (value) {
                            void setState;
                            (() {
                              value = value;
                            });
                          },
                        ),
                        Column(
                          children: [
                            Text(
                              "Join friend birthday party",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 50.0, top: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    child: Text(
                                  "12:00 pm",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 0)),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                      Icons.notifications_active_outlined,
                                      size: 18),
                                ),
                              ],
                            )
                          ],
                        )),
                  ]),
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 10),
                )),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          shape: const CircleBorder(),
                          splashRadius: 20,
                          onChanged: (value) {
                            void setState;
                            (() {
                              value = value;
                            });
                          },
                        ),
                        Column(
                          children: [
                            Text(
                              "Having Lunch at Home",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 50.0, top: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    child: Text(
                                  "3:00 pm",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 0)),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                      Icons.notifications_active_outlined,
                                      size: 18),
                                ),
                              ],
                            )
                          ],
                        )),
                  ]),
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                )),
              ],
            ),
          ],
        )),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 15,
    shadowColor: Colors.grey[50],
    borderOnForeground: true,
  ));
}

Widget get buildNote {
  return SizedBox(
      child: Card(
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
    child: Container(
        margin: const EdgeInsets.only(left: 15, right: 12, top: 12),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Note",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                )),
            Row(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Today - ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tue 27 Aug",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                SizedBox(
                    child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Join friend birthday party",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, left: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    child: Text(
                                  "last updated: 12:00 pm",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )),
                              ],
                            )
                          ],
                        )),
                  ]),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                )),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Column(
              children: [
                SizedBox(
                    child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Having Lunch at Home",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    child: Text(
                                  "last updated: 8:00 pm",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 0)),
                              ],
                            ),
                          ],
                        )),
                  ]),
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                )),
              ],
            ),
          ],
        )),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 15,
    shadowColor: Colors.grey[50],
    borderOnForeground: true,
  ));
}
