import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:word_stack/models/tiles_row.dart';



class WordRowsData extends ChangeNotifier{
  TilesRow row1 = TilesRow();
  TilesRow row2 = TilesRow();
  List<String>? st;
  WordRowsData({this.st});

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

  void pop(){
    st!.removeLast();
    notifyListeners();
  }

}

