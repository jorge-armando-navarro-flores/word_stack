import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/models/word_stack_data.dart';
import 'package:word_stack/models/letter_stack.dart';
import 'package:word_stack/screens/word_stack_screen.dart';
import 'models/word_rows_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    AppData appData = AppData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WordRowsData(),
        ),
        FutureProvider<LetterStack?>(
          create: (context) => appData.fetchWord(),
          initialData: null,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WordStackScreen(),
      ),
    );
  }
}
