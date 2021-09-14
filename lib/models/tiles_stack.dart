import 'package:word_stack/widgets/letter_tile.dart';

const int defaultWordLength = 5;

class TileStack {

  List<LetterTile> stack = [];

  void fillStack(String word) {
    clear();
    for (int i = word.length - 1; i >= 0; i--) {
      push(LetterTile(letter: word[i]));
    }
  }

  LetterTile peek() {
    if (stack.length == 0) {
      return LetterTile(letter: '');
    } else {
      return stack.last;
    }
  }

  void push(LetterTile letter) {
    stack.add(letter);
  }

  LetterTile pop() {
    return stack.removeLast();
  }

  bool isEmpty() {
    return stack.isEmpty;
  }

  void clear(){
    stack = [];
  }
}

