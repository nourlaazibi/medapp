import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';

class AppointmentBookedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/thumb_success.png'),
              SizedBox(
                height: 60,
              ),
              Text(
                'appointment_booked'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'your_appointment_is_confirmed'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.appointmentDetail);
                  },
                  text: 'done'.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
