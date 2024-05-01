import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../components/day_slot_item.dart';
import '../../../components/doctor_item1.dart';
import '../../../components/time_slot_item.dart';
import '../../../data/pref_manager.dart';
import '../../../model/doctor.dart';
import '../../../routes/routes.dart';

class TimeSlotPage extends StatefulWidget {
  @override
  _TimeSlotPageState createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
  int _selectedIndex = -1;

  Widget _slot(String time, int slots, String hour) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$time ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '$slots ${'slots'.tr().toLowerCase()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        MasonryGridView.count(
          padding: EdgeInsets.symmetric(horizontal: 10),
          crossAxisCount: 4,

          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: slots,
          // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return TimeSlotItem(
              time: hour,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.bookingStep4);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('time_slot'.tr()),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DoctorItem1(
              doctor: doctors[0],
            ),
            Container(
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              color: Prefs.getBool(Prefs.DARKTHEME, def: false)
                  ? Colors.white.withOpacity(0.12)
                  : Colors.grey[300],
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DaySlotItem(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selected: _selectedIndex == index,
                  );
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${'today'.tr()}, 24 Dec',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
              indent: 15,
              endIndent: 15,
            ),
            SizedBox(
              height: 25,
            ),
            _slot('morning'.tr(), 11, '08:30 AM'),
            SizedBox(
              height: 25,
            ),
            _slot('afternoon'.tr(), 9, '12:00 PM'),
            SizedBox(
              height: 25,
            ),
            _slot('evening'.tr(), 5, '04:00 PM'),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
