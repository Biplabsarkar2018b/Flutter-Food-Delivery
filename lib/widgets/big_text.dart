import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.size = 20,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          overflow: textOverflow,
          fontWeight: FontWeight.w400),
      overflow: textOverflow,
    );
  }
}
