import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/models/word_rows_data.dart';


import 'letter_tile.dart';


class WordStack extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Container(
      child: Draggable<LetterTile>(
        // Data is the value this Draggable stores.

        data: LetterTile(letter: Provider.of<WordRowsData>(context, listen: false).stack!.peek()),
        child: LetterTile(letter: Provider.of<WordRowsData>(context, listen: false).stack!.peek()),
        feedback: LetterTile(letter: Provider.of<WordRowsData>(context, listen: false).stack!.peek()),
        childWhenDragging: LetterTile(letter: Provider.of<WordRowsData>(context, listen: false).stack!.peek()),
        onDragCompleted: () {
          Provider.of<WordRowsData>(context, listen: false).changeRowsColor(Colors.white);




        },
        onDragStarted: () {
          Provider.of<WordRowsData>(context, listen: false).changeRowsColor(Colors.blue.shade200);
        },
        onDraggableCanceled: (Velocity g, Offset l) {
          Provider.of<WordRowsData>(context, listen: false).changeRowsColor(Colors.white);
        },
      ),
    );
  }
}
