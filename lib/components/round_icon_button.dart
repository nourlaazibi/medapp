import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final Color iconColor;
  final double elevation;
  final void Function() onPressed;

  RoundIconButton({
    required this.icon,
    this.size = 56,
    this.color = Colors.white,
    this.iconColor = kColorBlue,
    this.elevation = 0,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: elevation,
      fillColor: color,
      child: Icon(
        icon,
        color: iconColor,
      ),
      constraints: BoxConstraints.tightFor(
        width: size,
        height: size,
      ),
    );
  }
}
