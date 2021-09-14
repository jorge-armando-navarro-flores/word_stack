import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undo/undo.dart';
import 'package:word_stack/models/tiles_stack.dart';
import 'package:word_stack/models/tiles_row.dart';
import 'package:word_stack/providers/word_rows_data.dart';
import 'package:word_stack/widgets/letter_tile.dart';

class WordRow extends StatelessWidget {
  final TilesRow? row;
  WordRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer2<TileStack?, WordRowsData>(
        builder: (context, tileStack, wordRowsData, child) {
          return DragTarget<LetterTile>(
            onWillAccept: (value) =>
            !tileStack!.isEmpty(),
            builder: (BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,) {
              return Container(
                height: 70.0,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                color: row!.color,
                child: Row(
                  children: row!.stack,
                ),
              );
            },
            onAccept: (LetterTile data) {
              tileStack!.pop();

              wordRowsData.changes
                  .add(
                  new Change(
                      row!, () => row!.push(data),
                          (oldValue) => tileStack.push(row!.pop())
                  )
              );
            },
            onMove: (DragTargetDetails<LetterTile> details) {
              row!.changeColor(Colors.green.shade200);
            },
            onLeave: (LetterTile? letter) {
              row!.changeColor(Colors.blue.shade200);
            },
          );
        }
      ),
    );
  }
}
