import 'package:flutter/material.dart';
import 'package:my_app/colors/index.dart';
import 'package:my_app/components/search.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/provider/note_provider.dart';
import 'dart:ui';
import 'package:my_app/screen/notes/create.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<NoteScreen> {
  final _searchController = TextEditingController();
  List<Note> notes = [];
  final Future<String> _delay = Future<String>.delayed(
    const Duration(milliseconds: 400),
    () => 'It may take a while!',
  );

  @override
  initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _delay,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Notes',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Container(
                  child: search(_searchController, noteSearch),
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Expanded(
                  child: displayNotes,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: createButton,
              tooltip: 'Create Notes',
              backgroundColor: Colors.lightBlue,
              child: const Icon(
                Icons.border_color_rounded,
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
      },
    );
  }

  Widget get displayNotes {
    if (notes.isEmpty) {
      return Image.asset(
        'lib/images/no-data.jpg',
      );
    } else {
      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 2,
        children: notes.map(
          (note) {
            return noteScreenBody(note);
          },
        ).toList(),
      );
    }
  }

  Widget noteScreenBody(Note note) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: Colors.blue[100],
          onPrimary: Colors.blueAccent,
          shadowColor: Colors.grey[50],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => editButton(note),
        child: Column(
          children: [
            Column(
              children: [
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editButton(Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNote(note: note, type: 'edit'),
      ),
    );
    getValue();
  }

  Future<void> createButton() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNote(type: 'create'),
      ),
    );
    getValue();
  }

  Future<void> getValue() async {
    List<Note> _notes = await NoteProvider.instance.getAllNotes();
    setState(
      () {
        notes = _notes;
      },
    );
  }

  Future<void> noteSearch(value) async {
    if (value == '') {
      getValue();
    } else {
      List<Note> _notes =
          await NoteProvider.instance.searchNote(_searchController.text);
      setState(
        () {
          notes = _notes;
        },
      );
    }
  }
}
