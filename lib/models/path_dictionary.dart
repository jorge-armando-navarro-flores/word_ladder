import 'dart:collection';

class PathDictionary {
  Set<String>? words;
  int numberOfNodes = 0;
  Map<String, Set<String>> adjacentList = {};

  PathDictionary(this.words){
    for(String word in words!){
      addVertex(word);
    }

    for(String word1 in words!){
      for(String word2 in words!){
        if(isOneLetterDifferent(word1, word2) ){
          addEdge(word1, word2);
        }
      }
    }
  }

  void addVertex(String word){
    adjacentList[word] = {};
  }

  void addEdge(String word1, String word2){
    adjacentList[word1]!.add(word2);
//     adjacentList[word2]!.add(word1);
  }

  bool isOneLetterDifferent(String word1, String word2){
    int wordLength = word1.length;
    int differentLetters = 0;
    for(int i = 0; i< wordLength ; i++){
      if(word1[i] != word2[i]){
        differentLetters ++;
      }
    }

    if(differentLetters == 1){
      return true;
    } else{
      return false;
    }
  }

  bool isWord(String word) {
    return words!.contains(word.toLowerCase());
  }

  Set<String>? neighbours(String word) {
    return adjacentList[word];
  }

  List<String> findPath(String start, String end) {

    Set<String> array = {};
    List<List<String>> paths = [];
    List<String> path = [start];
    Queue queue = Queue();
    queue.add(path);
    while (queue.isNotEmpty){
      List<String> currentPath = queue.removeFirst();
      String currentWord = currentPath.last;
      array.add(currentWord);
      paths.add(currentPath);
      for(String child in neighbours(currentWord)!){
        if(!array.contains(child)){
          List<String> newPath = currentPath + [child];
          if(child == end){
            return newPath.sublist(1, newPath.length-1);
          }
          queue.add(newPath);
        }

      }

    }
    return [];
  }
}