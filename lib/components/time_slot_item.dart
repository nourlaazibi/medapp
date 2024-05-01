import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TimeSlotItem extends StatelessWidget {
  final String time;
  final void Function() onTap;

  const TimeSlotItem({Key? key, required this.time, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            Text(
              time.split(' ')[0],
              style: TextStyle(
                color: kColorPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              time.split(' ')[1],
              style: TextStyle(
                color: kColorPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
