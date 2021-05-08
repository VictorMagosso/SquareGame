import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Square {
  double dimensions;
  int value = 2;
  Color color = Colors.black;

  Square({this.dimensions = 10, required this.value, required this.color});
}
