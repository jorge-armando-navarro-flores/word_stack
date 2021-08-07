import 'package:flutter/material.dart';
import 'letter_tile.dart';

class StackedLayout extends StatefulWidget {
  final _StackedLayoutState stackedLayoutState = new _StackedLayoutState();

  void push(LetterTile letter) {
    stackedLayoutState.push(letter);
  }

  LetterTile pop() {
    return stackedLayoutState.pop();
  }

  void clear() {
    stackedLayoutState.clear();
    stackedLayoutState.tilesNumber = 0;
  }

  int getTilesNumber() {
    return stackedLayoutState.tilesNumber;
  }

  void setColor(Color newColor) {
    stackedLayoutState.setColor(newColor);
  }

  @override
  _StackedLayoutState createState() => stackedLayoutState;
}

class _StackedLayoutState extends State<StackedLayout> {
  List<LetterTile> wordStack = [];
  final int? tileSpaces;
  int tilesNumber = 0;
  Color color = Colors.white;

  _StackedLayoutState({this.tileSpaces});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: color,
      child: Row(
        children: wordStack,
      ),
    );
  }

  void push(LetterTile letter) {
    setState(() {
      wordStack.add(letter);
      tilesNumber += 1;
    });
  }

  LetterTile pop() {
    LetterTile tile = wordStack.removeLast();
    setState(() {
      tilesNumber -= 1;
    });
    return tile;
  }

  void clear() {
    setState(() {
      wordStack = [];
    });
  }

  void setColor(Color newColor) {
    setState(() {
      color = newColor;
    });
  }
}
