import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final String child;
  final Object? heroTag;
  final Color color;
  final Color backgroundColor;
  final double width;
  final double height;
  final double fontSize;
  final String fontFamily = 'Gentium Book Plus';
  final VoidCallback? actionOnPressed;
  final String? tooltip;

  ///Creates a custom floating action widget
  const FAB(
    this.child, {
    super.key,
    this.color = Colors.white,
    this.backgroundColor = Colors.black,
    this.fontSize = 36,
    this.width = 200,
    this.height = 75,
    required this.actionOnPressed,
    this.tooltip,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: child.length * 30,
      height: height,
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: actionOnPressed,
        tooltip: tooltip,
        isExtended: true,
        backgroundColor: backgroundColor,
        child: Text(
          child,
          style: TextStyle(
            fontFamily: fontFamily,
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
