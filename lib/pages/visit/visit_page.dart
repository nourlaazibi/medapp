import 'package:flutter/material.dart';

import '../../components/custom_profile_item.dart';
import '../../routes/routes.dart';

class VisitPage extends StatefulWidget {
  @override
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage>
    with AutomaticKeepAliveClientMixin<VisitPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VisitItem(
              date: 'FEB 14',
              time: 'Tue. 17:00',
              child: CustomProfileItem(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.visitDetail);
                },
                title: 'Tawfiq Bahri',
                subtitle: 'Family Doctor, Cardiologist',
                buttonTitle: 'See Full Reports',
                imagePath: 'assets/images/icon_doctor_1.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            VisitItem(
              date: 'JAN 08',
              time: 'Tue. 17:00',
              child: CustomProfileItem(
                onTap: () {},
                title: 'Josef Bouroumat',
                subtitle: 'Family Doctor, Cardiologist',
                buttonTitle: 'See Full Reports',
                imagePath: 'assets/images/icon_doctor_3.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    height: 1,
                    endIndent: 10,
                    color: Colors.grey[250],
                  ),
                ),
                Text('2018'),
                Expanded(
                  child: Divider(
                    height: 1,
                    indent: 10,
                    color: Colors.grey[250],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            VisitItem(
              date: 'NOV 24',
              time: 'Tue. 17:00',
              child: CustomProfileItem(
                onTap: () {},
                title: 'Amine Khlili',
                subtitle: 'Family Doctor, Cardiologist',
                buttonTitle: 'See Full Reports',
                imagePath: 'assets/images/icon_doctor_4.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class VisitItem extends StatelessWidget {
  final String date;
  final String time;
  final Widget child;

  const VisitItem(
      {Key? key, required this.date, required this.time, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
