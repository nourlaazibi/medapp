import 'package:flutter/material.dart';

class TestAndPrescriptionCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const TestAndPrescriptionCardWidget({
    Key? key,
    this.image = '',
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
