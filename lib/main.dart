import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

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

  String getScrambledString(String word1, String word2){
    String scrambledString = '';
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


    return scrambledString + word1.substring(w1Idx, word1.length) + word2.substring(w2Idx, word2.length);
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
    print(getScrambledString(word1!, word2!));
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container()
    );
  }
}
