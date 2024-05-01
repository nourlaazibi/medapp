import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/round_icon_button.dart';
import '../../data/pref_manager.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';
import '../examination/examination_page.dart';
import '../prescription/prescription_page.dart';
import '../test/test_page.dart';
import '../visit/visit_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  final _kTabTextStyle = TextStyle(
    color: kColorBlue,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final _kTabPages = [
    VisitPage(),
    ExaminationPage(),
    TestPage(),
    PrescriptionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool _isdark = Prefs.isDark();

    var _kTabs = [
      Tab(
        text: 'visit'.tr(),
      ),
      Tab(
        text: 'examination'.tr(),
      ),
      Tab(
        text: 'test'.tr(),
      ),
      Tab(
        text: 'prescription'.tr(),
      ),
    ];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          //color: Colors.white,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  'assets/images/icon_man.png',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tawfiq Bahri',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'bhr.tawfik@gmail.com',
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '+213 781 348 677',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.editProfile),
                icon: Icons.edit,
                size: 40,
                color: kColorBlue,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: DefaultTabController(
            length: _kTabs.length,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _isdark ? kColorDark : Color(0xfffbfcff),
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200]!,
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200]!,
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: kColorBlue,
                    labelStyle: _kTabTextStyle,
                    unselectedLabelStyle:
                        _kTabTextStyle.copyWith(color: Colors.grey),
                    labelColor: kColorBlue,
                    unselectedLabelColor: Colors.grey,
                    tabs: _kTabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: _kTabPages,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
