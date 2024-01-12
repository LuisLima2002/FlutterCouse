import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,
      {super.key, this.color = Colors.white, this.fontSize = 28});

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}
