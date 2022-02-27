import 'package:flutter/material.dart';
import 'dart:math';

final List<Color> circleColors = [
  Colors.red.shade50,
  Colors.blue.shade50,
  Colors.green.shade50,
  Colors.purple.shade50,
  Colors.cyan.shade50,
  Colors.yellow.shade50,
  Colors.amber.shade50,
  Colors.green.shade50,
  Colors.grey.shade50,
  Colors.orange.shade50,
];

Color randomBackgroundColors() {
  return circleColors[Random().nextInt(2)];
}
