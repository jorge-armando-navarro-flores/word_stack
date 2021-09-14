import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_stack/providers/word_stack_data.dart';
import 'package:word_stack/models/tiles_stack.dart';
import 'package:word_stack/screens/word_stack_screen.dart';
import 'providers/word_rows_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WordStackData wordStackData = WordStackData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WordRowsData(),
        ),
        FutureProvider<TileStack?>(
          create: (context) => wordStackData.fetchWord(),
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
