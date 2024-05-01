import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/constants.dart';
import '../model/doctor.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;
  final void Function() onTap;

  const DoctorItem({
    Key? key,
    required this.onTap,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                doctor.avatar!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          doctor.name!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: kColorBlue,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${doctor.rating!}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${'start_from'.tr()} \$${doctor.price}',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
