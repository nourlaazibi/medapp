import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_profile_item.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with AutomaticKeepAliveClientMixin<TestPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomProfileItem(
              onTap: () {},
              title: 'monthly_medical_check_up'.tr(),
              subtitle: '01/02/2019',
              buttonTitle: 'see_reports'.tr(),
              imagePath: 'assets/images/icon_medical_check_up.png',
            ),
            SizedBox(
              height: 20,
            ),
            CustomProfileItem(
              onTap: () {},
              title: 'monthly_medical_check_up'.tr(),
              subtitle: '01/01/2019',
              buttonTitle: 'see_reports'.tr(),
              imagePath: 'assets/images/icon_medical_check_up.png',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
