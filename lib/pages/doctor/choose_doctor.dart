import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/doctor_item.dart';
import '../../components/round_icon_button.dart';
import '../../model/doctor.dart';
import '../../utils/constants.dart';

class ChooseDoctor extends StatelessWidget {
  Widget _progress(int size, int progress) {
    List<Widget> widgets = [];
    for (var i = 0; i < size; i++) {
      widgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: i < progress ? kColorBlue : Colors.grey[300],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: <Widget>[...widgets],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'doctor'.tr(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              color: kColorBlue,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _progress(5, 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'choose_a_doctor'.tr(),
                style: TextStyle(
                  color: kColorDarkBlue,
                  fontSize: 20,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kColorBlue,
              ),
              child: Row(
                children: <Widget>[
                  RoundIconButton(
                    onPressed: () {},
                    icon: Icons.person_pin,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'any_available_doctor'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                height: 1,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorItem(
                  onTap: () {},
                  doctor: doctors[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
