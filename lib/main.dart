import 'package:flutter/material.dart';
import 'maze.dart';
import 'maze_widget.dart';

void main() {
  runApp(MazeGameApp());
}

class MazeGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maze Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MazeGameScreen(),
    );
  }
}

class MazeGameScreen extends StatefulWidget {
  @override
  _MazeGameScreenState createState() => _MazeGameScreenState();
}

class _MazeGameScreenState extends State<MazeGameScreen> {
  final MazeGame maze = MazeGame();

  void movePlayer(int dRow, int dCol) {
    setState(() {
      int newRow = maze.playerRow + dRow;
      int newCol = maze.playerCol + dCol;
      maze.movePlayer(newRow, newCol);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maze Game - Level ${maze.currentLevel + 1}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MazeWidget(maze: maze),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 60,),
                  onPressed: () => movePlayer(0, -1),
                ),

                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward, size: 60,),
                      onPressed: () => movePlayer(-1, 0),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_downward, size: 60,),
                      onPressed: () => movePlayer(1, 0),
                    ),

                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, size: 60,),
                  onPressed: () => movePlayer(0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
