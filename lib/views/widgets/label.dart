import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String child;
  final Color color;
  final double fontSize;
  final String fontFamily = 'Gentium Book Plus';

  ///Creates a heading widget
  const Label(this.child, this.color, {super.key, this.fontSize = 18});

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
