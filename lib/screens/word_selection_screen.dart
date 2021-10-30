import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_ladder/models/path_dictionary.dart';
import 'package:word_ladder/screens/solver_screen.dart';
import 'package:word_ladder/widgets/action_button.dart';

int WORD_SIZE = 4;

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

  Set<String> getSizedWordSet(Set<String> set, int wordSize){
    Set<String> sizedWordSet = {};
    for (String word in set){
      if(word.length == wordSize){
        sizedWordSet.add(word);
      }
    }
    return sizedWordSet;
  }

  void loadDictionary() async {
    String data = await rootBundle.loadString("text_files/words.txt");
    Set<String> wordSet = data.split('\n').toSet();
    Set<String> sizedWordSet = getSizedWordSet(wordSet, WORD_SIZE);
    setState(() {
      pathDictionary = PathDictionary(sizedWordSet);
    });
    print(pathDictionary!.findPath("gain", "fire"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDictionary();
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
                    List<String> wordsBetween = pathDictionary!.findPath("gain", "fire");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SolverScreen(
                          startWord: startWordController.text,
                          endWord: endWordController.text,
                          wordsBetween: wordsBetween,
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

