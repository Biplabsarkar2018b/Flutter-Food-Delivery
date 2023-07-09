import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData iconData;
  const IconContainer({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ,
      decoration: BoxDecoration(
        color: Colors.white24
      ),
      child: Icon(iconData),
    );
  }
}
