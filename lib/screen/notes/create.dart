import 'package:flutter/material.dart';
import 'package:my_app/components/delete_dialog.dart';
import 'package:my_app/components/textfield.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/provider/note_provider.dart';

// ignore: must_be_immutable
class CreateNote extends StatefulWidget {
  Note note;
  String type;

  CreateNote({Key? key, note, required this.type})
      : note = note ?? Note(title: '', text: ''),
        super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var noteId;
  // ignore: prefer_typing_uninitialized_variables
  var myType;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _textController.text = widget.note.text;
    noteId = widget.note.id;
    myType = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8), child: updateButton),
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: (myType == 'edit') ? deleteButton : null),
        ],
        title: const Text('Notes',
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
      body: ListView(
        children: [
          textField(_titleController, 'Enter title', 1, 'title'),
          textField(_textController, 'Enter text', 15, 'text'),
        ],
      ),
    );
  }

  Future<void> editAndCreateNote() async {
    Note note = Note(
      title: _titleController.text,
      text: _textController.text,
      id: noteId,
    );
    bool? success = false;
    // ignore: unused_local_variable
    bool? error = false;
    String? message;
    try {
      if (myType == 'edit') {
        NoteProvider.instance.update(note);
        message = 'Updated successfully';
        success = true;
      } else {
        if (_titleController.text == '' && _textController.text == '') {
          message = "Empty Note Discarded";
          success = false;
        } else {
          NoteProvider.instance.insert(note);
          message = 'Created successfully';
          success = true;
        }
      }
    } catch (e) {
      if (myType == 'edit') {
        message = 'Error editing';
      } else {
        message = 'Error creating';
      }
      error = true;
    } finally {
      final snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        content: Text(
          message!,
          style: const TextStyle(fontSize: 14),
        ),
        // ignore: unrelated_type_equality_checks
        backgroundColor: success == true ? Colors.lightBlue : Colors.redAccent,
      );
      Navigator.pop(context, note);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> deleteNote() async {
    bool success = false;
    String? message;
    try {
      NoteProvider.instance.delete(noteId);
      message = 'Deleted successfully';
      success = true;
    } catch (e) {
      message = 'Error deleted';
      success = false;
    } finally {
      final snackBar = SnackBar(
        content: Text(
          message!,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: success ? Colors.lightBlue : Colors.redAccent,
      );

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget get updateButton {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.square(10),
        elevation: 0,
        primary: Colors.blue[50],
      ),
      onPressed: editAndCreateNote,
      child: const Icon(
        Icons.check,
        size: 30,
        color: Colors.blueAccent,
      ),
    ));
  }

  Widget get deleteButton {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.square(10),
        elevation: 0,
        primary: Colors.red[50],
      ),
      onPressed: () => openDialog(context, _titleController.text, deleteNote),
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.redAccent,
      ),
    ));
  }
}
