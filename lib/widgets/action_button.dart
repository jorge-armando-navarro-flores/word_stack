import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  ActionButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[300],
      ),
      onPressed: onPressed,
      child: Text(text!, style: TextStyle(color: Colors.black)),
    );
  }
}
