import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';

Widget displayCategories(Category category, int index, category_states,
    getTasksByCategory, setState, changeActive, openDialogDeleteCategory) {
  return Container(
    margin: const EdgeInsets.all(4),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        primary: category_states[index] ? Colors.lightBlue : Colors.blue[50],
        onPrimary: Colors.blueAccent,
        shadowColor: Colors.grey[50],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        getTasksByCategory(category.id);
        var _states = category_states;
        for (var i = 0; i < _states.length; i++) {
          _states[i] = i == index;
        }
        setState(() {
          category_states = _states;
          changeActive = false;
        });
        changeActive = false;
      },
      onLongPress: () {
        openDialogDeleteCategory(category.id);
      },
      child: Text(
        category.name,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: category_states[index] ? Colors.white : Colors.lightBlue),
      ),
    ),
  );
}
