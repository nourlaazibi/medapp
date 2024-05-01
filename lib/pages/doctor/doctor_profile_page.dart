import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../components/custom_circular_indicator.dart';
import '../../components/round_icon_button.dart';
import '../../utils/constants.dart';

class DoctorProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              //backgroundColor: Colors.white,
              elevation: 1,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/doctor_profile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
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
                            'available_now'.tr().toUpperCase(),
                            style: TextStyle(
                              color: Color(0xff40E58C),
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Tawfiq Bahri',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          Text(
                            'Family Doctor. Cardiologist',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RatingBar(
                      itemSize: 20,
                      initialRating: 4.5,
                      allowHalfRating: false,
                      itemCount: 5,
                      ignoreGestures: true,
                      // itemBuilder: (context, _) => Icon(
                      //   Icons.star,
                      //   color: Colors.amber,
                      // ),
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: SizedBox(),
                        empty: Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.85,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'good_reviews'.tr(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.95,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'total_score'.tr(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.9,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'satisfaction'.tr(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'about'.tr(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Doctor Tawfiq Bahri, is a Doctor primarily located in New York, with another office in Atlantic City, New Jersey. He has 16 years of experience. His specialities include Family Medicine and Cardiology.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.message,
                      elevation: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.phone,
                      elevation: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fillColor: kColorBlue,
                        child: Container(
                          height: 48,
                          child: Center(
                            child: Text(
                              'book_an_appointment'.tr().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
