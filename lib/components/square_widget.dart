import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  double dimensions;
  num value = 2;
  Color color = Colors.black;

  SquareWidget(
      {this.dimensions = 10, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
