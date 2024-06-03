import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/pages/profile/edit_profile_page.dart';

import '../../components/round_icon_button.dart';
import '../../data/pref_manager.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';
import '../examination/examination_page.dart';
import '../prescription/prescription_page.dart';
import '../test/test_page.dart';
import '../visit/visit_page.dart';

class ProfilePage extends StatefulWidget {
  final UserModel userModel;

  const ProfilePage({super.key, required this.userModel});
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
    // ExaminationPage(),
    // TestPage(),
    // PrescriptionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool _isdark = Prefs.isDark();

    var _kTabs = [
      Tab(
        text: 'visit'.tr(),
      ),
      // Tab(
      //   text: 'examination'.tr(),
      // ),
      // Tab(
      //   text: 'test'.tr(),
      // ),
      // Tab(
      //   text: 'prescription'.tr(),
      // ),
    ];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          //color: Colors.white,
          child: Row(
            children: <Widget>[
              widget.userModel.profilePicture == null
                  ? CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/icon_man.png',
                      ),
                    )
                  : CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        widget.userModel.profilePicture!,
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
                      '${widget.userModel.firstName} ${widget.userModel.lastName}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.userModel.email,
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.userModel.phone != null
                          ? widget.userModel.phone!
                          : "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            userModel: widget.userModel,
                          )),
                ),
                // Navigator.of(context).pushNamed(Routes.editProfile),
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
