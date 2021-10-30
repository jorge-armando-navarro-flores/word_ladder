import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_ladder/models/path_dictionary.dart';
import 'package:word_ladder/models/text_field_color.dart';
import 'package:word_ladder/widgets/action_button.dart';


int WORD_SIZE = 4;
class SolverScreen extends StatefulWidget {
  final String? startWord;
  final String? endWord;
  const SolverScreen({Key? key,
    this.startWord,
    this.endWord,
  }
    ) : super(key: key);

  @override
  State<SolverScreen> createState() => _SolverScreenState();
}

class _SolverScreenState extends State<SolverScreen> {

  List<Field> fields = [];
  PathDictionary? pathDictionary;
  List<String>? wordsBetween;

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
      wordsBetween = pathDictionary!.findPath(widget.startWord!, widget.endWord!);
      createFields();
    });
    print(pathDictionary!.findPath(widget.startWord!, widget.endWord!));
  }

  void createFields (){
    for(String word in wordsBetween!){
      fields.add(Field());
    }
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
              child: ListView.builder(
                  itemCount: fields.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WordField(
                      textFieldColor: fields[index],
                      onSubmited: (value){
                        setState(() {
                          if(pathDictionary!.isWord(value)){
                            fields[index].changeColor(Colors.green);
                          }else{
                            fields[index].changeColor(Colors.red);
                          }
                        });
                      },
                    );
                  }
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
                        for (int i = 0; i < wordsBetween!.length; i++){
                          fields[i].changeColor(Colors.black);
                          fields[i].changeFieldWord(wordsBetween![i]);
                        }
                        setState(() {

                        });
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
  final Field? textFieldColor;
  final Function(String)? onSubmited;
  WordField({this.textFieldColor, this.onSubmited});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldColor!.textEditingController,
      style: TextStyle(
        color: textFieldColor!.textColor
      ),
      onSubmitted: onSubmited,
    );
  }
}
