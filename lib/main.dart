import 'package:flutter/material.dart';
import 'the-game.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROCK-PAPER-SCISSORS GAME',
    home: Scaffold(
      backgroundColor: Colors.blueAccent,
    body: Container(
    width: double.infinity,  
    margin: EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Let's Play Rock-Paper-Scissors",style: TextStyle(fontSize: 20)),
          SizedBox(height: 50),
          Game(),
        ],
      ),
    ),
    ),
  );
}
}
