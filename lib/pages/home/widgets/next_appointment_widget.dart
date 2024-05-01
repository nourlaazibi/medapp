import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/round_icon_button.dart';
import '../../../utils/constants.dart';

class NextAppointmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      'tomorrow'.tr(),
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
                      '11 January 2019, 10:00 AM',
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
                    'assets/images/icon_doctor_1.png',
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
                    'Tawfiq Bahri',
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
                    'Family Doctor, Cardiologist',
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
  }
}
