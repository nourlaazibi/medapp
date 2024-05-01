import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_profile_item.dart';

class ExaminationPage extends StatefulWidget {
  @override
  _ExaminationPageState createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage>
    with AutomaticKeepAliveClientMixin<ExaminationPage> {
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
              title: 'physical_examination'.tr(),
              subtitle: '14/02/2019',
              buttonTitle: 'see_reports'.tr(),
              imagePath: 'assets/images/icon_examination.png',
            ),
            SizedBox(
              height: 20,
            ),
            CustomProfileItem(
              onTap: () {},
              title: 'mri_examination'.tr(),
              subtitle: '12/02/2019',
              buttonTitle: 'see_reports'.tr(),
              imagePath: 'assets/images/icon_examination.png',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
