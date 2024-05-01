import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AppBarTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.add,
          color: kColorPink,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Med',
                style: TextStyle(
                  color: kColorBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'APP',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
