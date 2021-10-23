import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_ladder/models/path_dictionary.dart';
import 'package:word_ladder/screens/solver_screen.dart';

class WordSelectionScreen extends StatefulWidget {
  const WordSelectionScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WordSelectionScreen> createState() => _WordSelectionScreenState();
}

class _WordSelectionScreenState extends State<WordSelectionScreen> {
  TextEditingController startWordController = TextEditingController();
  TextEditingController endWordController = TextEditingController();
  PathDictionary? pathDictionary;

  void loadDictionary() async {
    String data = await rootBundle.loadString("text_files/words.txt");
    Set<String> wordSet = data.split('\n').toSet();
    print(wordSet);
    setState(() {
      pathDictionary = PathDictionary(wordSet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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

class ActionButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const ActionButton({Key? key,
    this.text,
    this.onPressed}
      ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFD6D7D7),
      ),
    );
  }
}
