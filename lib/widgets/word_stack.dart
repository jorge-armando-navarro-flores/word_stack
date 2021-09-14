import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/models/tiles_stack.dart';
import 'package:word_stack/providers/word_rows_data.dart';
import 'letter_tile.dart';


class WordStack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Provider.of<TileStack?>(context) == null ? CircularProgressIndicator():
    Container(
      child: Consumer2<TileStack, WordRowsData>(
        builder: (context, tileStack, wordRowsData, child)
    {
      return Draggable<LetterTile>(
        // Data is the value this Draggable stores.

        data: tileStack.peek(),
        child: tileStack.peek(),
        feedback: tileStack.peek(),
        childWhenDragging: tileStack.peek(),
        onDragCompleted: () {
          wordRowsData.changeRowsColor(Colors.white);
        },
        onDragStarted: () {
          wordRowsData.changeRowsColor(Colors.blue.shade200);
        },
        onDraggableCanceled: (Velocity g, Offset l) {
          wordRowsData.changeRowsColor(Colors.white);
        },
      );
    }
      )
    );
  }
}
