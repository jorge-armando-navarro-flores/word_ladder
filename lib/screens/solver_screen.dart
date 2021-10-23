import 'package:flutter/material.dart';
class SolverScreen extends StatelessWidget {
  final String? startWord;
  final String? endWord;
  const SolverScreen({Key? key,
    this.startWord,
    this.endWord}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solver"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(startWord!),
            Text(endWord!),
          ],
        ),
      ),
    );
  }
}
