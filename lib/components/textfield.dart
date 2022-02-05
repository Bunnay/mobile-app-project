import 'package:flutter/material.dart';

Widget textField(_textController, hintText, minLines) {
  return SizedBox(
    child: Card(
      elevation: 0,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          TextFormField(
            controller: _textController,
            minLines: minLines,
            keyboardType: TextInputType.text,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
              filled: true,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
              fillColor: Colors.grey[200],
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
            ),
          ),
        ],
      ),
    ),
  );
}
