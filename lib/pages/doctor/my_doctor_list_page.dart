import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/providers/doctors_provider.dart';
import 'package:provider/provider.dart';

import '../../components/my_doctor_list_item.dart';
import '../../model/doctor.dart';

class MyDoctorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorList = Provider.of<DoctorsProvider>(context).doctors;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_doctor_list'.tr(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: doctorList.length,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyDoctorListItem(
            doctor: doctorList[index],
          );
        },
      ),
    );
  }
}
