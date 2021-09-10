import 'package:flutter/material.dart';

import 'package:word_stack/models/tiles_row.dart';

import 'package:word_stack/widgets/letter_tile.dart';

class WordRow extends StatelessWidget {


  final TilesRow? row;
  WordRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DragTarget<LetterTile>(
        onWillAccept: (value) => true,
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
          // tiles.add(data);
          // Provider.of<LetterStack>(context, listen: false).pushTile(row!, data);
          row!.addTile(data);
        },
        onMove: (DragTargetDetails<LetterTile> details) {
          row!.changeColor(Colors.green.shade200);
          // Provider.of<LetterStack>(context, listen: false).changeRowColor(row!, Colors.green.shade200);

        },
        onLeave: (LetterTile? letter) {
          row!.changeColor(Colors.blue.shade200);
          // Provider.of<LetterStack>(context, listen: false).changeRowColor(row!, Colors.blue.shade200);
        },
      ),
    );
  }
}

