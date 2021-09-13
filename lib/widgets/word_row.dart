import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undo/undo.dart';
import 'package:word_stack/models/letter_stack.dart';
import 'package:word_stack/models/tiles_row.dart';
import 'package:word_stack/models/word_rows_data.dart';
import 'package:word_stack/widgets/letter_tile.dart';

class WordRow extends StatelessWidget {
  final TilesRow? row;
  WordRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DragTarget<LetterTile>(
        onWillAccept: (value) =>
            !Provider.of<LetterStack>(context, listen: false).isEmpty(),
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 70.0,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            color: row!.color,
            child: Row(
              children: row!.tiles,
            ),
          );
        },
        onAccept: (LetterTile data) {
          Provider.of<LetterStack>(context, listen: false).pop();

          Provider.of<WordRowsData>(context, listen: false).changes.add(
              new Change(
                  row!,
                  () => row!.addTile(data),
                  (oldValue) =>
                      Provider.of<LetterStack>(context, listen: false).push(row!.removeTile().letter)));
        },
        onMove: (DragTargetDetails<LetterTile> details) {
          row!.changeColor(Colors.green.shade200);
        },
        onLeave: (LetterTile? letter) {
          row!.changeColor(Colors.blue.shade200);
        },
      ),
    );
  }
}
