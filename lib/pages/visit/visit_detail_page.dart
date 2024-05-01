import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_profile_item.dart';

class VisitDetailPage extends StatefulWidget {
  @override
  _VisitDetailPageState createState() => _VisitDetailPageState();
}

class _VisitDetailPageState extends State<VisitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'visit_detail'.tr(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: Image.asset(
                              'assets/images/icon_doctor_1.png',
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
                                  'Tawfiq Bahri',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Family Doctor. Cardiologist',
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                'Thu. 17:00 - 14 February 2019',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                'St. Anthony Street 15A. Moscow',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'diagnosis'.tr(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Theme.of(context).textTheme.headline6!.color,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'The most possible cause of your pain is Acute Pharyngitis. This is more commonly known as \'sore throat\'. It\'s a chort-term infection of pharynx (throat) caused by different viruses or bacteria',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              CustomProfileItem(
                onTap: () {},
                title: 'physical_examination'.tr(),
                subtitle: '14/02/2019',
                buttonTitle: 'see_reports'.tr(),
                imagePath: 'assets/images/icon_examination.png',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'recommendation'.tr(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Theme.of(context).textTheme.headline6!.color,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Most case of Acute Pharyngitis are self-limited, meaning they\'ll resolve independently. In those cases, medical care is primarily supportive and includes pain relievers',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
