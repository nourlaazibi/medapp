import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../data/pref_manager.dart';
import '../../../utils/constants.dart';
import 'widgets/widgets.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final bool _isDark = Prefs.isDark();
  late Color _color;

  @override
  void initState() {
    _color = _isDark ? kColorDark : Colors.grey[50]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorBlue,
        title: Text(
          'filter'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SortWidget(
                      color: _color,
                    ),
                    AvailabilityWidget(
                      color: _color,
                    ),
                    GenderWidget(
                      color: _color,
                    ),
                    ConsultationFeeWidget(
                      color: _color,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {},
                text: 'apply'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
