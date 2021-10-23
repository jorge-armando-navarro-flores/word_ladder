import 'package:flutter/material.dart';
import 'package:word_ladder/screens/word_selection_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordSelectionScreen(title: 'Word Ladder'),
    );
  }
}

