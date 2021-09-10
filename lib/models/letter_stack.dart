class LetterStack{
  Letter? top;
  Letter? bottom;
  int length = 0;

  LetterStack(){
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  String peek(){
    if (this.length == 0){
      return '';
    }else{
      return this.top!.value!;
    }

  }

  void push(String letter){
    Letter newNode = Letter(letter);
    if(this.top == null){
      this.bottom = newNode;
      this.top = newNode;
      this.length++;

    } else{
      newNode.next = this.top;
      this.top = newNode;
      this.length++;
    }
  }

  String pop(){
    if (this.length == 0){
      return '';
    }else{
      String letterPop = this.top!.value!;
      this.top = this.top!.next;
      this.length --;
      return letterPop;
    }


  }

  bool isEmpty(){
    if (this.length == 0){
      return true;
    } else{
      return false;
    }
  }

  void printStack(){
    List<String> array = [];

    Letter? currentNode = this.top;
    while(currentNode != null){
      array.add(currentNode.value!);
      currentNode = currentNode.next;
    }

    print(array);

  }

}

class Letter{

  String? value;
  Letter? next;

  Letter(String value){
    this.value = value;
    this.next = null;
  }
}
