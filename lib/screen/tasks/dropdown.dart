import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/provider/category_provider.dart';

class DropDown extends StatefulWidget {
  final Function(int? category) onChange;
  const DropDown({Key? key, required this.onChange}) : super(key: key);
  @override
  State<DropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<DropDown> {
  String? dropdownValue;
  int? newValue;
  List<Category> categories = [];
  Category? category;

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: category,
      elevation: 0,
      borderRadius: BorderRadius.circular(10.0),
      style: const TextStyle(color: Colors.lightBlue),
      focusColor: Colors.red,
      hint: dropdownValue == null
          ? const Text('Select a category')
          : Text(
              dropdownValue!,
              style: const TextStyle(color: Colors.blue),
            ),
      onChanged: (category) {
        widget.onChange(category!.id);
        setState(() {
          dropdownValue = category.name;
          newValue = category.id;
        });
      },
      items: categories.map((category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(
            category.name
                .toLowerCase()
                .split(" ")
                .map((word) =>
                    word[0].toUpperCase() + word.substring(1, word.length))
                .join(" "),
          ),
        );
      }).toList(),
    );
  }

  Future<void> getValue() async {
    List<Category> _categories =
        await CategoryProvider.instance.getAllCategories();
    setState(
      () {
        categories = _categories;
      },
    );
  }
}
