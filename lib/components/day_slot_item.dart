import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DaySlotItem extends StatelessWidget {
  final bool selected;
  final void Function() onTap;

  const DaySlotItem({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? Colors.blue[300]! : Colors.grey,
            width: 2, //selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '${'today'.tr()}, 24 Dec',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: kColorPrimaryDark, fontWeight: FontWeight.w600),
            ),
            Text(
              '24 ${'slots_available'.tr().toLowerCase()}',
              style: TextStyle(
                color: Colors.greenAccent[400],
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
