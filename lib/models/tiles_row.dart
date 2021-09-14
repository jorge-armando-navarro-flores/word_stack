import 'package:flutter/material.dart';
import 'package:word_stack/models/tiles_stack.dart';

class TilesRow extends TileStack{
  Color color = Colors.white;

  void changeColor(Color newColor){
    color = newColor;
  }

}