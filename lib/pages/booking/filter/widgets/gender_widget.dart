import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final Color color;

  const GenderWidget({Key? key, required this.color}) : super(key: key);
  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  bool _male = false;
  bool _female = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'gender'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        CheckboxListTile(
          value: _male,
          onChanged: (value) {
            setState(() {
              _male = value!;
            });
          },
          title: Text('male_doctor'.tr()),
        ),
        CheckboxListTile(
          value: _female,
          onChanged: (value) {
            setState(() {
              _female = value!;
            });
          },
          title: Text('female_doctor'.tr()),
        ),
      ],
    );
  }
}
