import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medapp/model/health_category.dart';
import 'package:medapp/pages/booking/step4/patient_details_page.dart';
import 'package:medapp/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/day_slot_item.dart';
import '../../../components/doctor_item1.dart';
import '../../../components/time_slot_item.dart';
import '../../../data/pref_manager.dart';
import '../../../model/doctor.dart';

class TimeSlotPage extends StatefulWidget {
  final Doctor doctor;
  final HealthCategory healthCategory;
  TimeSlotPage({required this.doctor,required this.healthCategory});
  @override
  _TimeSlotPageState createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
  int _selectedIndex = -1;
  DateTime _selectedDate = DateTime.now();

  Widget _slot(String time, List<String> timeSlots) {
    final userProvider = Provider.of<CurrentUserProvider>(context).currentUser;
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
          itemCount: timeSlots.length,
          // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return TimeSlotItem(
              time: timeSlots[index],
              onTap: () {
                DateTime selectedTime =
                    DateFormat('hh:mm a').parse(timeSlots[index]);
                _selectedDate =
                    DateTime.now().add(Duration(days: _selectedIndex));
                _selectedDate = DateTime(
                    _selectedDate.year,
                    _selectedDate.month,
                    _selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute);
                print(_selectedDate);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientDetailsPage(
                            dateTime: _selectedDate,
                            doctor: widget.doctor,
                            userModel: userProvider!,
                            healthCategory: widget.healthCategory,
                          )),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    int counter = -1;
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
              doctor: widget.doctor,
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
                itemCount: 7,
                itemBuilder: (context, index) {
                  counter++;
                  return DaySlotItem(
                    dateTime: dateTime.add(Duration(days: counter)),
                    onTap: () {
                      setState(() {
                        //  _selectedDate.add(Duration(days: _selectedIndex));
                        _selectedIndex = index;
                        print(_selectedDate);
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
                  '${'today'.tr()}, ${DateFormat('EEE dd').format(dateTime)}',
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
            _slot(
              'morning'.tr(),
              [
                '08:00 AM',
                '08:30 AM',
                '09:00 AM',
                '09:30 AM',
                '10:00 AM',
                '10:30 AM'
              ],
            ),
            SizedBox(
              height: 25,
            ),
            _slot(
              'afternoon'.tr(),
              ['12:00 PM', '12:30 PM', '01:00 PM', '01:30 PM', '02:00 PM'],
            ),
            SizedBox(
              height: 25,
            ),
            _slot(
              'evening'.tr(),
              ['04:00 PM', '04:30 PM', '05:00 PM', '05:30 PM', '06:00 PM'],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
