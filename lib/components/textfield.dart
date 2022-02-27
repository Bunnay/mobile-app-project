import 'package:flutter/material.dart';

Widget textField(_textController, hintText, minLines, type) {
  return SizedBox(
    child: Card(
      elevation: 0,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            minLines: minLines,
            keyboardType: type == 'title' ? TextInputType.text : TextInputType.multiline,
            maxLines: null,
            style: TextStyle(
              fontSize: type == 'title' ? 20 : 14,
              fontWeight: type == 'title' ? FontWeight.bold : FontWeight.normal,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
              filled: true,
              // border: const OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(15)),
              //     borderSide: BorderSide(color: Colors.white, width: 0)),
              fillColor: Colors.grey[50],
              border: InputBorder.none,
              hintText: hintText,
              // enabledBorder: const OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(15)),
              //     borderSide: BorderSide(color: Colors.white, width: 0)),
              // focusedBorder: const OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(15)),
              //     borderSide: BorderSide(color: Colors.white, width: 0)),
            ),
          ),
        ],
      ),
    ),
  );
}
