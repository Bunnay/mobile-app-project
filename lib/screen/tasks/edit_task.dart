import 'package:flutter/material.dart';
import 'package:my_app/screen/tasks/dropdown.dart';

showEditBottomModal(
  BuildContext context,
  _titleController,
  editTask,
  onChange,
  task,
) {

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 200,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: const Text(
                    "Edit Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 10),
                      child: TextFormField(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(
                              20.0, 10.0, 100.0, 10.0),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                          fillColor: Colors.grey[200],
                          hintText: 'Input new task here',
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                        ),
                      ),
                    )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ElevatedButton(
                          onPressed: editTask,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.send,
                            size: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropDown(onChange: (value) {
                      onChange(value);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
