import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/my_doctor_list_item.dart';
import '../../model/doctor.dart';

class MyDoctorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyDoctorListItem(
            doctor: doctors[index],
          );
        },
      ),
    );
  }
}
