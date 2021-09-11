import 'package:flutter/material.dart';
import 'package:word_stack/widgets/letter_tile.dart';
class TilesRow{
  List<LetterTile> tiles = [];
  Color color = Colors.white;
  void changeColor(Color newColor){
    color = newColor;
  }

  void addTile(LetterTile tile){
    tiles.add(tile);
  }

  void clear(){
    tiles = [];
  }

  LetterTile removeTile(){
    return tiles.removeLast();
  }

}