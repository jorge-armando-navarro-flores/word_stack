import 'package:flutter/material.dart';
import 'stacked_layout.dart';
import 'package:undo/undo.dart';
import 'letter_tile.dart';

class StackedLayoutBrain extends StatelessWidget {
  const StackedLayoutBrain({
    Key? key,
    required this.wordStack,
    required this.changes,
    required this.word,
  }) : super(key: key);

  final StackedLayout wordStack;
  final ChangeStack changes;
  final List<String> word;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DragTarget<LetterTile>(
        onWillAccept: (value) => word.length > 0,
        builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
            ) {
          return wordStack;
        },
        onAccept: (LetterTile data) {
          changes.add(new Change(wordStack, () => wordStack.push(data),
                  (oldValue) => word.add(wordStack.pop().letter)));
        },
        onMove: (DragTargetDetails<LetterTile> details) {
          wordStack.setColor(Colors.green.shade200);
        },
        onLeave: (LetterTile? letter) {
          wordStack.setColor(Colors.blue.shade200);
        },
      ),
    );
  }
}
