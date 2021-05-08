import 'package:flutter/material.dart';
import 'package:square_game/pages/game/game_screen.dart';
import 'package:square_game/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreenWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
