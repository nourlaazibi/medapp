import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medapp/components/visited_doctor_list_item.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/services/db/booking_db.dart';

class VisitedDoctorList extends StatelessWidget {
  const VisitedDoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Doctor>>(
      future:
          BookingDB().getVisitedDoctors(FirebaseAuth.instance.currentUser!.uid,context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<Doctor> doctors = snapshot.data ?? [];

          return Container(
            height: 160,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 15),
              itemCount: doctors.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return VisitedDoctorListItem(
                  doctor: doctors[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
