import 'package:flutter/material.dart';
import 'package:medapp/components/round_icon_button.dart';
import 'package:medapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class NextAppoinementShimmer extends StatefulWidget {
  const NextAppoinementShimmer({super.key});

  @override
  State<NextAppoinementShimmer> createState() => _NextAppoinementShimmerState();
}

class _NextAppoinementShimmerState extends State<NextAppoinementShimmer> {
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
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
                            Container(
                              width: 120,
                              height: 25,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 80,
                              height: 14,
                              color: Colors.white,
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120,
                            height: 14,
                            color: Colors.white,
                          ),
                          SizedBox(height: 2),
                          Container(
                            width: 100,
                            height: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );;
  }
}