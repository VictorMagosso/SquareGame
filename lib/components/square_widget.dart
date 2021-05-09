import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  double dimensions;
  num value = 2;
  Color color = Colors.blue;

  SquareWidget(
      {this.dimensions = 10, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: color,
        border: Border.all(
          color: Colors.white,
          width: .8,
        ),
      ),
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
