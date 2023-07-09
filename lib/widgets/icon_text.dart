import 'package:flutter/material.dart';
import 'package:foody/widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  double iconsSize, textSize;
  final Color iconColor;
  IconText({
    super.key,
    required this.iconData,
    required this.text,
    required this.iconColor,
    this.iconsSize = 23,
    this.textSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: iconsSize,
          color: iconColor,
        ),
        SmallText(
          text: text,
          size: textSize,
        ),
      ],
    );
  }
}
