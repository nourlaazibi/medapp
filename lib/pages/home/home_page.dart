import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/0dev/faker_doctor.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/pages/home/widgets/visitied_doctor.dart';
import 'package:medapp/services/db/doctor_db.dart';

import '../../routes/routes.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final UserModel currentUser;
  HomePage({required this.currentUser});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final bool _noAppoints = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //final list = generateRandomDoctors(40);
    //DoctorDB().addDoctors(list);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/hand.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${'hello'.tr()} ${widget.currentUser.firstName},',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        'how_are_you_today'.tr(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _noAppoints
                ? NoAppointmentsWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            SectionHeaderWidget(
                              title: 'next_appointment'.tr(),
                            ),
                            NextAppointmentWidget(),
                            SectionHeaderWidget(
                              title: 'doctors_you_have_visited'.tr(),
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(Routes.myDoctors),
                            ),
                          ],
                        ),
                      ),
                      VisitedDoctorList(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SectionHeaderWidget(
                              title: 'your_prescriptions'.tr(),
                              onPressed: () {},
                            ),
                            TestAndPrescriptionCardWidget(
                              title: 'Tuberculosis ${'recipe'.tr()}',
                              subtitle: '${'given_by'.tr()} Tawfiq Bahri',
                              image: 'icon_medical_recipe.png',
                            ),
                            //test results
                            SectionHeaderWidget(
                              title: 'test_results'.tr(),
                              onPressed: () {},
                            ),
                            TestAndPrescriptionCardWidget(
                              title: 'Monthly Medical Check Up',
                              subtitle: '1 January 2019',
                              image: 'icon_medical_check_up.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
