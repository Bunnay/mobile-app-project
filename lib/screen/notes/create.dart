import 'package:flutter/material.dart';
import 'package:my_app/database/db.dart';
import 'package:my_app/models/note.dart';

void main() {
  runApp(const CreateNote(title: '',text: ''));
}

class CreateNote extends StatefulWidget {
  final String title;
  final String text;
  const CreateNote({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  List<Note> notes = [];
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
          iconTheme: const IconThemeData(
              size: 10, color: Colors.lightBlue, opacity: 1),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(children: [
          titleField,
          textField,
          action,
        ]));
  }

  Widget get titleField {
    // var _titleController = TextEditingController();
    return SizedBox(
        child: Card(
            elevation: 0,
            margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Column(children: [
              TextFormField(
                initialValue: widget.title,
                // controller: _titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // suffixIcon: IconButton(
                  //   onPressed: _titleController.clear,
                  //   icon: const Icon(Icons.clear),
                  // ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  fillColor: Colors.grey[200],
                  hintText: 'Enter title...',
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                ),
              ),
            ])));
  }

  Widget get textField {
  // var _controller = TextEditingController();
  return SizedBox(
      child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(children: [
            TextFormField(
              // controller: _controller,
              minLines: 10,
              initialValue: widget.text,
              keyboardType: TextInputType.text,
              maxLines: null,
              decoration: InputDecoration(
                // suffixIcon: IconButton(
                //   onPressed: _controller.clear,
                //   icon: const Icon(Icons.clear),
                //   padding: const EdgeInsets.only(top: 0, left: 0)
                // ),
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
                fillColor: Colors.grey[200],
                hintText: 'Enter text...',
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 0)),
              ),
            ),
          ])));
}
}



Widget button(Color color, IconData icon, clickEvent) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: color,
    padding: const EdgeInsets.all(10),
    shape: const CircleBorder(),
  );

  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: clickEvent,
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    )),
  );
}

Widget get action {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      button(Colors.red, Icons.delete, delete),
      button(Colors.blueAccent, Icons.check, update)
    ],
  );
}

delete() {}
update() {}
