import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/providers/doctors_provider.dart';
import 'package:medapp/providers/user_provider.dart';
import 'package:medapp/services/db/booking_db.dart';
import 'package:provider/provider.dart';

import '../../components/my_doctor_list_item.dart';

class MyDoctorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userPovider = Provider.of<CurrentUserProvider>(context).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_doctor_list'.tr(),
        ),
      ),
      body: FutureBuilder<List<Doctor>>(
        future: BookingDB().getVisitedDoctors(userPovider!.id, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No visited doctors found'));
          } else {
            final visitedDoctors = snapshot.data!;
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
              itemCount: visitedDoctors.length,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              itemBuilder: (context, index) {
                return MyDoctorListItem(
                  doctor: visitedDoctors[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
