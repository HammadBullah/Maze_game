import 'package:flutter/material.dart';
import 'maze.dart';

class MazeWidget extends StatelessWidget {
  final MazeGame maze;

  MazeWidget({required this.maze});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: maze.levels[maze.currentLevel][0].length,
      ),
      itemBuilder: (context, index) {
        int row = index ~/ maze.levels[maze.currentLevel][0].length;
        int col = index % maze.levels[maze.currentLevel][0].length;
        if (row == maze.playerRow && col == maze.playerCol) {
          return Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.blue,
          );
        } else if (maze.levels[maze.currentLevel][row][col] == 1) {
          return Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.black,
          );
        } else if (maze.levels[maze.currentLevel][row][col] == 2) {
          return Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.green,
          );
        } else {
          return Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.white,
          );
        }
      },
      itemCount: maze.levels[maze.currentLevel].length * maze.levels[maze.currentLevel][0].length,
    );
  }
}
