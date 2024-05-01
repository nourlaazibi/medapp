import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum SortBy { nothing, fee }

class SortWidget extends StatefulWidget {
  final Color color;

  const SortWidget({Key? key, required this.color}) : super(key: key);
  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  SortBy _sortBy = SortBy.nothing;

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
              'sort_by'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        RadioListTile(
          value: SortBy.nothing,
          onChanged: (SortBy? value) {
            setState(() {
              _sortBy = value!;
            });
          },
          groupValue: _sortBy,
          title: Text('default'.tr()),
        ),
        RadioListTile(
          value: SortBy.fee,
          onChanged: (SortBy? value) {
            setState(() {
              _sortBy = value!;
            });
          },
          groupValue: _sortBy,
          title: Text('consultaion_fee'.tr()),
        ),
      ],
    );
  }
}
