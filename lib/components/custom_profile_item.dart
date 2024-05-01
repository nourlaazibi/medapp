import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomProfileItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final void Function() onTap;
  final String buttonTitle;
  final String? subtitle2;

  const CustomProfileItem({
    Key? key,
    this.imagePath = '',
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.buttonTitle,
    this.subtitle2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              child: Image.asset(
                imagePath,
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
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Visibility(
                    visible: subtitle2 == null ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${'given_at'.tr()} 14/02/2019',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          buttonTitle,
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: kColorPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
