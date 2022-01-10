import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:my_app/notes/create.dart';

void main() {
  runApp(const Note());
}

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNote()),
          );
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
}

Widget get allNotes {
  return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      crossAxisCount: 2,
      children: <Widget>[
        noteScreenBody("What is an Essay in your opinion?",
            "An essay is, generally, a piece of writing that gives the author's own argument, but the definition is vague, overlapping with those of a letter, a paper, an article, a pamphlet, and a short story."),
        noteScreenBody("Definitions",
            "The word essay derives from the French infinitive essayer, 'to try' or 'to attempt'."),
        noteScreenBody("Montaigne",
            "Inspired in particular by the works of Plutarch, a translation of whose Œuvres Morales (Moral works) into French had just been published by Jacques Amyot, Montaigne began to."),
        noteScreenBody("Europe",
            "While Montaigne's philosophy was admired and copied in France, none of his most immediate disciples tried to write essays."),
        noteScreenBody("Japan",
            "As with the novel, essays existed in Japan several centuries before they developed in Europe with a genre of essays known as zuihitsu—loosely connected essays."),
        noteScreenBody("Cause and effect",
            "The defining features of a 'cause and effect' essay are causal chains that connect from a cause to an effect, careful language, and chronological or emphatic order"),
      ]);
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
                hintText: 'Search notes',
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
              ),
            ),
          ])));
}

Widget noteScreenBody(String title, String text) {
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
        onPressed: () {},
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
                            text,
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
