import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/booking.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/pages/home/widgets/no_appointments_widget.dart';
import 'package:medapp/pages/shimmer/next_appoinmenet_shimmer.dart';
import 'package:medapp/services/db/booking_db.dart';
import 'package:medapp/utils/constants.dart';
import 'package:medapp/utils/timestamp_to_date.dart';

import '../../../components/round_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';

class NextAppointmentWidget extends StatelessWidget {
  const NextAppointmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Booking?>(
      future: BookingDB()
          .fetchMostRecentBooking(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return NextAppoinementShimmer();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final booking = snapshot.data!;
          final doctor = doctors.firstWhere(
            (element) => element.id == booking.doctorId,
          );
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: kColorBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${DateFormat('EEE dd').format(timestampToDateTime(booking.date))}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${DateFormat('hh:mm a').format(timestampToDateTime(booking.date))},',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.map,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 40,
                  thickness: 0.5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 56,
                      height: 56,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          '${doctor.avatar}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Patient: ${booking.patient}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          doctor.name ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          // no data
          return NoAppointmentsWidget();
        }
      },
    );
  }
}
