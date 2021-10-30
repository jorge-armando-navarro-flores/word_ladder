import 'package:flutter/material.dart';

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
