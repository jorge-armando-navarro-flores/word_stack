import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/providers/word_stack_data.dart';
import 'package:word_stack/models/tiles_stack.dart';
import 'package:word_stack/providers/word_rows_data.dart';
import 'package:word_stack/widgets/action_button.dart';
import 'package:word_stack/widgets/word_row.dart';
import 'package:word_stack/widgets/word_stack.dart';

class WordStackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Word Stack"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Consumer2<TileStack?, WordRowsData>(
          builder: (context, tileStack, wordRowsData, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WordRow(row: wordRowsData.row1),
                WordRow(row: wordRowsData.row2),
                WordStack(),
                Row(
                  children: [
                    ActionButton(
                      text: 'Start',
                      onPressed: () {
                        wordRowsData.clearRows();
                        tileStack!.fillStack(WordStackData.currentScrambledWord);
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ActionButton(
                      text: 'Undo',
                      onPressed: () {
                        wordRowsData.undo();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        )
      ),
    );
  }
}
