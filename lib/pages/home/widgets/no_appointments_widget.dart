import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class NoAppointmentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/icon_no_appointments.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            'there_is_no_appontments'.tr(),
            style: TextStyle(
              color: kColorDarkBlue,
              fontSize: 20,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'create_new_appointment'.tr(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: Icon(
              Icons.arrow_downward,
              color: kColorBlue,
            ),
          ),
        ],
      ),
    );
  }
}
