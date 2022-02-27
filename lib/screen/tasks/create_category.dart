import 'package:flutter/material.dart';

Future openDialog(context, _categoryNameController, createCategory) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Category',
            style: TextStyle(
              color: Colors.lightBlue,
            )),
        content: TextFormField(
          controller: _categoryNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white, width: 0)),
            fillColor: Colors.grey[200],
            hintText: 'Input new category here',
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white, width: 0)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white, width: 0)),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Cancel',
            ),
          ),
          ElevatedButton(
            onPressed: createCategory,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              primary: Colors.white,
            ),
            child: const Text('Submit',
                style: TextStyle(
                  color: Colors.lightBlue,
                )),
          ),
        ],
      ),
    );
