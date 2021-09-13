import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/models/app_data.dart';
import 'package:word_stack/models/letter_stack.dart';
import 'package:word_stack/models/word_rows_data.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WordRow(row: Provider.of<WordRowsData>(context).row1),
            WordRow(row: Provider.of<WordRowsData>(context).row2),
            WordStack(),
            Row(
              children: [
                ActionButton(
                  text: 'Start',
                  onPressed: () {
                    Provider.of<WordRowsData>(context, listen: false).clearRows();
                    Provider.of<LetterStack>(context, listen: false).rebuildStack(AppData.address);

                    // setState(() {
                    //   wordStack1.clear();
                    //   wordStack2.clear();
                    //   scrambledLetters = scrambledString.split('').reversed.toList();
                    // });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                ActionButton(
                  text: 'Undo',
                  onPressed: () {
                    Provider.of<WordRowsData>(context, listen: false).undo();
                    // setState(() {
                    //   changes.undo();
                    // });
                  },
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
