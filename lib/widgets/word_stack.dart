import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/models/letter_stack.dart';
import 'package:word_stack/models/word_rows_data.dart';


import 'letter_tile.dart';


class WordStack extends StatelessWidget {

  final LetterStack? stack;
  WordStack({this.stack});


  @override
  Widget build(BuildContext context) {


    return Provider.of<LetterStack?>(context) == null ? CircularProgressIndicator():
    Container(
      child: Draggable<LetterTile>(
        // Data is the value this Draggable stores.

        data: LetterTile(letter: Provider.of<LetterStack>(context, listen: false).peek()),
        child: LetterTile(letter: Provider.of<LetterStack>(context, listen: false).peek()),
        feedback: LetterTile(letter: Provider.of<LetterStack>(context, listen: false).peek()),
        childWhenDragging: LetterTile(letter: Provider.of<LetterStack>(context, listen: false).peek()),
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
