import 'package:word_stack/widgets/letter_tile.dart';

const int defaultWordLength = 5;

class LetterStack {

  List<LetterTile> stack = [];
  // Letter? top;
  // Letter? bottom;
  // int length = 0;



  void fillStack(String word) {
    // top = null;
    // bottom = null;
    // length = 0;
    clear();
    for (int i = word.length - 1; i >= 0; i--) {
      push(word[i]);
    }


  }

  LetterTile peek() {
    if (stack.length == 0) {
      return LetterTile(letter: '');
    } else {
      return stack.last;
    }


  }

  void push(String letter) {
    // Letter newNode = Letter(letter);
    // if (this.top == null) {
    //   this.bottom = newNode;
    //   this.top = newNode;
    //   this.length++;
    // } else {
    //   newNode.next = this.top;
    //   this.top = newNode;
    //   this.length++;
    // }

    stack.add(LetterTile(letter: letter));
  }

  LetterTile pop() {
    // if (this.length == 0) {
    //   return '';
    // } else {
    //   String letterPop = this.top!.value!;
    //   this.top = this.top!.next;
    //   this.length--;
    //   return letterPop;
    // }

    return stack.removeLast();
  }

  bool isEmpty() {
    // if (this.length == 0) {
    //   return true;
    // } else {
    //   return false;
    // }
    return stack.isEmpty;
  }

  void clear(){
    stack = [];
  }

  // void printStack() {
  //   List<String> array = [];
  //
  //   Letter? currentNode = this.top;
  //   while (currentNode != null) {
  //     array.add(currentNode.value!);
  //     currentNode = currentNode.next;
  //   }
  //
  //   print(array);
  // }
}

// class Letter {
//   String? value;
//   Letter? next;
//
//   Letter(String value) {
//     this.value = value;
//     this.next = null;
//   }
// }
