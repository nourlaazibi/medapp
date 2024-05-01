import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomRecipeItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String days;
  final String pills;

  const CustomRecipeItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.days,
    required this.pills,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(4),
      //   border: Border.all(width: 1, color: Colors.grey[200]),
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  child: Image.asset(
                    'assets/images/icon_pill_bottle.png',
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
                        subTitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 75),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'days_of_treat'.tr(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        days,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'pill_per_day'.tr(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        pills,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
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
