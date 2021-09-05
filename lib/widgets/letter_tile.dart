import 'package:flutter/material.dart';
class LetterTile extends StatelessWidget {
  const LetterTile({
    Key? key,
    required this.letter,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      color: Colors.yellow[100],
      child: Center(
        child: Text(
          letter,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
      ),
    );
  }
}
