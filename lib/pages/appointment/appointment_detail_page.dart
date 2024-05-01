import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/doctor_item1.dart';
import '../../data/pref_manager.dart';
import '../../model/doctor.dart';
import '../../utils/constants.dart';

class AppointmentDetailPage extends StatefulWidget {
  @override
  _AppointmentDetailPageState createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  final bool _isdark = Prefs.isDark();

  Color get _color => _isdark ? kColorDark : Colors.white;

  Widget dateAndTime() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'date_and_time'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${'tomorrow'.tr()}, 8:30 AM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${'in'.tr()} 13 ${'hours'.tr()}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget practiceDetail() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'practice_detail'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'YourHealth Medical Centre',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '3719  Jehovah Drive, Roanoke, Virginia - 24011',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'get_direction'.tr().toUpperCase(),
                style: TextStyle(
                  color: kColorBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget procedure() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'procedure'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Consultation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingDetails() {
    return Container(
      width: double.infinity,
      color: _color,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'booked_for'.tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tawfiq Bahri',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: VerticalDivider(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'appointment_id'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '9355476',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'appointment_details'.tr(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: _isdark ? Colors.transparent : Colors.grey[300],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: _isdark ? Colors.transparent : Colors.white,
                        child: DoctorItem1(
                          doctor: doctors[0],
                        ),
                      ),
                      Divider(
                        color: _isdark ? Colors.black : Colors.grey[300],
                      ),
                      dateAndTime(),
                      Divider(),
                      practiceDetail(),
                      Divider(),
                      procedure(),
                      Divider(),
                      bookingDetails(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${'manage_you_appointments_better'.tr()} ',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'my_appointments'.tr(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                text: 'done'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
