import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:undo/undo.dart';
import 'package:word_stack/models/letter_stack.dart';
import 'package:word_stack/models/tiles_row.dart';
import 'package:word_stack/widgets/letter_tile.dart';



class WordRowsData extends ChangeNotifier{
  TilesRow row1 = TilesRow();
  TilesRow row2 = TilesRow();
  LetterStack? stack;
  final changes = new ChangeStack();
  WordRowsData({this.stack});

  void changeRowsColor(Color newColor){
    row1.changeColor(newColor);
    row2.changeColor(newColor);
    notifyListeners();
  }

  void clearRows(){
    row1.clear();
    row2.clear();
    notifyListeners();
  }

  String pop(){
    String removed = stack!.pop();

    return removed;
  }

  void undo(){
    changes.undo();
    notifyListeners();
  }

}

