import 'package:flutter/material.dart';
import 'package:word_ladder/widgets/action_button.dart';
class SolverScreen extends StatefulWidget {
  final String? startWord;
  final String? endWord;
  final List<String>? wordsBetween;
  const SolverScreen({Key? key,
    this.startWord,
    this.endWord,
    this.wordsBetween
  }
    ) : super(key: key);

  @override
  State<SolverScreen> createState() => _SolverScreenState();
}

class _SolverScreenState extends State<SolverScreen> {

  List<WordField> fields = [];

  void createFields (){
    for(String word in widget.wordsBetween!){
      fields.add(WordField());
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Solver"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.startWord!),
            Expanded(
              flex: 5,
              child: ListView(
                  children: fields,
              ),
            ),
            Expanded(
              flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.endWord!),
                    ActionButton(
                      text: "Solve",
                      onPressed: (){
                        for (int i = 0; i < widget.wordsBetween!.length; i++){
                          fields[i].changeFieldWord(widget.wordsBetween![i]);
                        }
                      },
                    )
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}

class WordField extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
    );
  }

  void changeFieldWord(String word){
    textEditingController.value = textEditingController.value.copyWith(
      text: word,
    );
  }
}
