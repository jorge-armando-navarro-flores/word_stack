import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:undo/undo.dart';
import 'letter_tile.dart';
import 'stacked_layout_brain.dart';
import 'stacked_layout.dart';
import 'action_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word stack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Word stack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? word1;
  String? word2;
  int defaultWordLength = 5;
  int acceptedData = 0;
  String scrambledString = '';
  List<String> scrambledLetters = [];

  StackedLayout wordStack1 = StackedLayout();
  StackedLayout wordStack2 = StackedLayout();

  var changes = new ChangeStack();

  void setScrambledString(String word1, String word2){
    int w1Idx = 0;
    int w2Idx = 0;
    while (w1Idx < word1.length && w2Idx < word2.length){
      int chosenWord = 1 + Random().nextInt(2);
      if(chosenWord == 1){
        scrambledString += word1[w1Idx];
        w1Idx++;
      } else if (chosenWord == 2){
        scrambledString += word2[w2Idx];
        w2Idx++;
      }
    }
    scrambledString += word1.substring(w1Idx, word1.length) + word2.substring(w2Idx, word2.length);
    scrambledLetters = scrambledString.split('').reversed.toList();


    
  }

  onStartGame() async{
    String data = await rootBundle.loadString("textFiles/words.txt");
    List<String> wordList = data.split('\n');
    List<String> sizedWordList = [];
    for(String word in wordList){
      if(word.length == defaultWordLength){
        sizedWordList.add(word);
      }
    }
    word1 = sizedWordList[Random().nextInt(sizedWordList.length)];
    word2 = sizedWordList[Random().nextInt(sizedWordList.length)];
    print(word1);
    print(word2);
    setState(() {
      setScrambledString(word1!, word2!);
    });

    print(scrambledString);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onStartGame();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StackedLayoutBrain(wordStack: wordStack1, changes: changes, word: scrambledLetters),
            StackedLayoutBrain(wordStack: wordStack2, changes: changes, word: scrambledLetters),
            Draggable<LetterTile>(
              // Data is the value this Draggable stores.

              data: LetterTile(
                letter: scrambledLetters.isNotEmpty? scrambledLetters.last : " ",
              ),
              child: LetterTile(letter: scrambledLetters.isNotEmpty? scrambledLetters.last : " "),
              feedback: LetterTile(letter: scrambledLetters.isNotEmpty? scrambledLetters.last : " "),
              childWhenDragging: LetterTile(letter: scrambledLetters.isNotEmpty? scrambledLetters.last : " "),
              onDragCompleted: () {
                setState(() {
                  wordStack1.setColor(Colors.white);
                  wordStack2.setColor(Colors.white);
                  if (scrambledLetters.length > 0) {
                    scrambledLetters.removeLast();
                  }
                });
              },
              onDragStarted: () {
                wordStack1.setColor(Colors.blue.shade200);
                wordStack2.setColor(Colors.blue.shade200);
              },
              onDraggableCanceled: (Velocity g, Offset l) {
                wordStack1.setColor(Colors.white);
                wordStack2.setColor(Colors.white);
              },
            ),
            Row(
              children: [
                ActionButton(
                  text: 'Start',
                  onPressed: () {
                    setState(() {
                      wordStack1.clear();
                      wordStack2.clear();
                      scrambledLetters = scrambledString.split('').reversed.toList();
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                ActionButton(
                  text: 'Undo',
                  onPressed: () {
                    setState(() {
                      changes.undo();
                    });
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
