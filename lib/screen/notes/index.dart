import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:my_app/database/db.dart';
import 'package:my_app/models/note.dart';
import 'dart:ui';
import 'package:my_app/screen/notes/create.dart';

void main() {
  runApp(const NoteScreen());
}

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<NoteScreen> {
  List<Note> notes = [];
  @override
  initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes',
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
        Expanded(
          child: allNotes,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const CreateNote()),
          // );
          // Note note = Note(
          //     title: 'What is English',
          //     text:
          //         'English is the language that people use to communicate each other as a second language in the world beside their native language.');
          // NoteProvider.instance.insert(note);
          // NoteProvider.instance.delete(1);
        },
        tooltip: 'Create Notes',
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.border_color_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> getValue() async {
    List<Note> _notes = await NoteProvider.instance.getAllNotes();
    setState(() {
      notes = _notes;
    });
  }


  Widget get allNotes {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 2,
        children: notes.map((note) {
          return noteScreenBody(note);
        }).toList());
  }

  Widget noteScreenBody(Note note) {
    return Container(
        margin: const EdgeInsets.all(3),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            primary: Colors.white,
            onPrimary: Colors.blueAccent,
            shadowColor: Colors.grey[50],
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNote(
                title: note.title,
                text: note.text,
              ),
            ));
          },
          child: Column(
            children: [
              Column(children: [
                Container(
                    margin: const EdgeInsets.only(top: 5, left: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              note.title,
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
                        )
                      ],
                    )),
                const Divider(height: 20, thickness: 1),
                Container(
                    margin: const EdgeInsets.only(top: 5, left: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              note.text,
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[700],
                              ),
                            )),
                          ],
                        )
                      ],
                    )),
              ]),
            ],
          ),
        ));
  }
}

Widget get search {
  return SizedBox(
      child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.grey[200],
                hintText: 'Search notes',
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
              ),
            ),
          ])));
}
