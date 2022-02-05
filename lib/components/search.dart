import 'package:flutter/material.dart';

Widget search(_searchController, onChangedSearch) {
  return SizedBox(
    child: Card(
      elevation: 0,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          TextFormField(
            controller: _searchController,
            onChanged: (value) => onChangedSearch(value),
            decoration: InputDecoration(
              filled: true,
              contentPadding:
                  const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.grey[200],
              hintText: 'Search tasks',
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
