import 'package:flutter/material.dart';

import '../model/doctor.dart';

class DoctorItem1 extends StatelessWidget {
  final Doctor doctor;

  const DoctorItem1({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              doctor.avatar!,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  doctor.name!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  doctor.speciality!,
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
