import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                height: 150,
                minWidth: 150,
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                height: 150,
                minWidth: 150,
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;

      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;

                playerBScore = playerBScore + 5;
              });

              double winningHeight = MediaQuery.of(context).size.height - 60;

              if (blueCardHeight >= winningHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(playerBScore, "b")),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height: blueCardHeight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    playerBScore.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                blueCardHeight = blueCardHeight - 30;
                redCardHeight = redCardHeight + 30;

                playerAScore = playerAScore + 5;
              });
              double winningHeight = MediaQuery.of(context).size.height - 60;

              if (redCardHeight >= winningHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(playerAScore, "a")),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height: redCardHeight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    playerAScore.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {

  int winningScore = 0;

  String whoWins = "";

  ResultPage(this.winningScore, this.whoWins);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whoWins == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(winningScore.toString(), style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            Text(whoWins == "a" ? "Player A wins" : "Player B wins", style: TextStyle(fontSize:35, fontWeight: FontWeight.bold)),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart game "),
            )
          ],
        ),
      ),
    );
  }
}
