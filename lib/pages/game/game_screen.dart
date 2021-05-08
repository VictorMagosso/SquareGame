import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:square_game/components/square_widget.dart';

class GameScreenWidget extends StatefulWidget {
  @override
  _GameScreenWidgetState createState() => _GameScreenWidgetState();
}

class _GameScreenWidgetState extends State<GameScreenWidget>
    with TickerProviderStateMixin {
  //max level = 5;
  var levelController = 5;

  //deslizar para baixo
  var _slideDownController;
  var offset;

  //positions
  double posx = 100.0;
  double posy = 100.0;

  double squarePositionXController = 144.0;
  double squarePositionYController = -80.0;

  _moveSquareWhereDidType(TapDownDetails details) {
    posx = details.globalPosition.dx;
    posy = details.globalPosition.dy;

    var mobileScreenWidth = MediaQuery.of(context).size.width;

    if (posx >= 0 && posx < mobileScreenWidth / 5 - 0.01) {
      posx = 0;
    }
    if (posx >= mobileScreenWidth / 5 - 0.01 &&
        posx < mobileScreenWidth / 2.5 - 0.01) {
      posx = 72;
    }
    if (posx >= mobileScreenWidth / 2.5 - 0.01 &&
        posx < mobileScreenWidth / (5 / 3) - 0.01) {
      posx = 144;
    }
    if (posx >= mobileScreenWidth / (5 / 3) - 0.01 &&
        posx < mobileScreenWidth / 1.25 - 0.01) {
      posx = 216;
    }
    if (posx >= mobileScreenWidth / 1.25 - 0.01 && posx < mobileScreenWidth) {
      posx = 288;
    }
    setState(() {
      squarePositionXController = posx;
    });
    print('$posx - fullsize: ${MediaQuery.of(context).size.width}');
  }

  @override
  void initState() {
    super.initState();

    _slideDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    Future.delayed(Duration(milliseconds: 100))
        .then((_) => _slideDownController.forward());

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 9.7))
        .animate(_slideDownController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) =>
            {_moveSquareWhereDidType(details)},
        child: Container(
            color: Colors.black87,
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsets.only(top: 35),
            child: Stack(
              children: [
                Positioned(
                  left: squarePositionXController,
                  top: squarePositionYController,
                  child: SlideTransition(
                    position: offset,
                    child: _buildSquare,
                  ),
                )
              ],
            )),
      ),
    );
  }

  _newSquare() {
    var randomNumber;
    Color color = Colors.black;

    switch (levelController) {
      case 1:
        randomNumber = Random().nextInt(5);
        break;
      case 2:
        randomNumber = Random().nextInt(6);
        break;
      case 3:
        randomNumber = Random().nextInt(7);
        break;
      case 4:
        randomNumber = Random().nextInt(8);
        break;
      case 5:
        randomNumber = Random().nextInt(9);
        break;
      default:
    }
    randomNumber == 0 ? randomNumber = 1 : randomNumber = randomNumber;
    num number = pow(2, randomNumber);

    switch (number) {
      case 2:
        color = Colors.blue;
        break;
      case 4:
        color = Colors.green;
        break;
      case 8:
        color = Colors.amber;
        break;
      case 16:
        color = Colors.grey;
        break;
      case 32:
        color = Colors.red;
        break;
      case 64:
        color = Colors.pink;
        break;
      case 128:
        color = Colors.orange;
        break;
      case 256:
        color = Colors.greenAccent;
        break;
      default:
    }

    setState(() {
      _buildSquare = SquareWidget(value: number, color: color);
    });
  }

  SquareWidget _buildSquare = SquareWidget(value: 16, color: Colors.black);
}
