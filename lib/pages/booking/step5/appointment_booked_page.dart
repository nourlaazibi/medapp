import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/booking.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/pages/appointment/appointment_detail_page.dart';
import 'package:medapp/services/mailer.dart';

import '../../../components/custom_button.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants.dart';

class AppointmentBookedPage extends StatefulWidget {
  final Doctor doctor;
  final DateTime dateTime;
  final Booking booking;

  const AppointmentBookedPage(
      {super.key,
      required this.doctor,
      required this.dateTime,
      required this.booking});

  @override
  State<AppointmentBookedPage> createState() => _AppointmentBookedPageState();
}

class _AppointmentBookedPageState extends State<AppointmentBookedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendEmail(FirebaseAuth.instance.currentUser!.email!, "appointment booked",
        "booked with doctor: ${widget.doctor.fullName}");
  }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentDetailPage(
                              doctor: widget.doctor,
                              dateTime: widget.dateTime,
                              booking: widget.booking)),
                    );
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
