import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final double? textSize;

  const CustomOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = kColorPrimary,
    this.borderRadius = 4,
    this.padding =
        const EdgeInsets.only(top: 9, bottom: 10, left: 16, right: 16),
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(color: color, width: 1),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button!.copyWith(
              color: color,
              fontSize:
                  textSize ?? Theme.of(context).textTheme.button!.fontSize),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
