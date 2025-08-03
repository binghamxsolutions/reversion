import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String child;
  final Color color;
  final double fontSize;
  final String fontFamily = 'Press Start 2P';

  ///Creates a heading widget
  const Heading(
    this.child, {
    super.key,
    this.color = Colors.black,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
