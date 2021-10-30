import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_ladder/models/path_dictionary.dart';
import 'package:word_ladder/screens/solver_screen.dart';
import 'package:word_ladder/widgets/action_button.dart';



class WordSelectionScreen extends StatelessWidget {
  final String? title;
  WordSelectionScreen({this.title});
  TextEditingController startWordController = TextEditingController();
  TextEditingController endWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter a start and end word for the ladder"),
            const SizedBox(height: 30,),
            TextField(
              controller: startWordController,
            ),
            TextField(
              controller: endWordController,
            ),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  text: "Start",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SolverScreen(
                          startWord: startWordController.text,
                          endWord: endWordController.text,
                        ))
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

