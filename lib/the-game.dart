import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Widget userIcon = Icon(Icons.question_mark, color: Colors.red);
  Widget computerIcon = Icon(Icons.question_mark, color: Colors.red);
  List<Widget> icons = [
    Image.asset('images/rock.png'),
    Image.asset('images/scissors.png'),
    Image.asset('images/paper.png'),
  ];
  List<Widget> result = [
    Text(
      'It is a Tie 😐',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text(
      'You Win 🥳',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text(
      'You Lose  😢',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ];
  int indexIcon = 0;
  int userScore = 0;
  int computerScore = 0;
  Widget resultOfGame = Text('');
  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      userIcon = Icon(Icons.question_mark, color: Colors.red);
      computerIcon = Icon(Icons.question_mark, color: Colors.red);
      userScore = 0;
      computerScore = 0;
      resultOfGame = Text('');
    });
  }

  ButtonStyle transparentCircleButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
    );
  }

  Random random = Random();

  void comparison(int userindex) {
    setState(() {
      userIcon = icons[userindex];
      int compIndex = random.nextInt(3);
      computerIcon = icons[compIndex];
      if (userindex == 0 && compIndex == 1 ||
          userindex == 1 && compIndex == 2 ||
          userindex == 2 && compIndex == 0) {
        userScore++;
        resultOfGame = result[1];
      } else if (userindex == 0 && compIndex == 2 ||
          userindex == 1 && compIndex == 0 ||
          userindex == 2 && compIndex == 1) {
        computerScore++;
        resultOfGame = result[2];
      } else {
        resultOfGame = result[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            userIcon,
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Computer: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            computerIcon,
          ],
        ),
        SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                comparison(0);
              },

              style: transparentCircleButtonStyle(),
              child: icons[0],
            ),
            SizedBox(width: 10),
            

            ElevatedButton(
              onPressed: () {
                comparison(1);
              },
              style: transparentCircleButtonStyle(),
              child: icons[1],
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                comparison(2);
              },
              style: transparentCircleButtonStyle(),
              child: icons[2],
            ),
          ],
        ),
        SizedBox(height: 30),
        resultOfGame,
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $userScore',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Text(
              'Computer Score: $computerScore',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        SizedBox(height: 15),

        ElevatedButton(
          onPressed: resetGame,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          child: Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.identity()..scale(-1.0, 1.0), // Flip horizontally
            child: Icon(Icons.refresh, color: Colors.red, size: 40),
          ),
        ),
      ],
    );
  }
}
