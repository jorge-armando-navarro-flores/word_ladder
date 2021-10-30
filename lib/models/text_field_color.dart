import 'package:flutter/material.dart';
class Field {
  TextEditingController textEditingController = TextEditingController();
  Color textColor = Colors.black;

  void changeColor(Color newColor){
    textColor = newColor;
  }
  void changeFieldWord(String word){
    textEditingController.value = textEditingController.value.copyWith(
      text: word,
    );
  }
}