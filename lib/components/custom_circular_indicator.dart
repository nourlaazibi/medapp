import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/constants.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double radius;
  final double percent;
  final double lineWidth;
  final double? line1Width;
  final String footer;

  const CustomCircularIndicator({
    Key? key,
    required this.radius,
    required this.percent,
    this.lineWidth = 5,
    this.line1Width,
    this.footer = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircularPercentIndicator(
          radius: radius / 2,
          animation: true,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: kColorBlue,
          arcBackgroundColor: Colors.grey[300],
          arcType: ArcType.FULL,
          lineWidth: lineWidth,
          percent: percent,
          center: Center(
            child: Text(
              '${(percent * 100).toInt()}%',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Visibility(
          visible: footer.isNotEmpty ? true : false,
          child: Text(
            footer,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
