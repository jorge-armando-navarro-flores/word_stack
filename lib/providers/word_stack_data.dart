import 'dart:math';
import 'package:flutter/services.dart';
import 'package:word_stack/models/tiles_stack.dart';


class WordStackData{

   static String currentScrambledWord = "";

    String setScrambledString(String word1, String word2) {
      int w1Idx = 0;
      int w2Idx = 0;
      String scrambledString = "";
      while (w1Idx < word1.length && w2Idx < word2.length) {
        int chosenWord = 1 + Random().nextInt(2);
        if (chosenWord == 1) {
          scrambledString += word1[w1Idx];
          w1Idx++;
        } else if (chosenWord == 2) {
          scrambledString += word2[w2Idx];
          w2Idx++;
        }
      }
      return scrambledString += word1.substring(w1Idx, word1.length) +
          word2.substring(w2Idx, word2.length);
    }

   Future<TileStack> fetchWord() async{
      String data = await rootBundle.loadString("textFiles/words.txt");
      List<String> wordList = data.split('\n');
      List<String> sizedWordList = [];

      for(String word in wordList){
        if(word.length == defaultWordLength){
          sizedWordList.add(word);
        }
      }

      String word1 = sizedWordList[Random().nextInt(sizedWordList.length)];
      String word2 = sizedWordList[Random().nextInt(sizedWordList.length)];
      print(word1);
      print(word2);

      String scrambledString = setScrambledString(word1, word2);
      currentScrambledWord = scrambledString;

      TileStack letterStack =TileStack();
      letterStack.fillStack(scrambledString);

      return letterStack;
    }
}

