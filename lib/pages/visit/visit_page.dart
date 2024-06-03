import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medapp/components/custom_profile_item.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/model/health_category.dart';
import 'package:medapp/pages/shimmer/visit_shimmer.dart';
import 'package:medapp/providers/doctors_provider.dart';
import 'package:medapp/routes/routes.dart';
import 'package:medapp/services/db/booking_db.dart';
import 'package:medapp/model/booking.dart';
import 'package:provider/provider.dart';

class VisitPage extends StatefulWidget {
  @override
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage>
    with AutomaticKeepAliveClientMixin<VisitPage> {
  late Future<List<Booking>> _userBookingsFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doctorsList = Provider.of<DoctorsProvider>(context).doctors;
    super.build(context);
    return FutureBuilder<List<Booking>>(
      future:
          BookingDB().getUserBookings(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerVisitItem();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No bookings found.'));
        } else {
          List<Booking> bookings = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bookings.map((booking) {
                  Doctor doctor = doctorsList.firstWhere(
                    (element) => element.id == booking.doctorId,
                  );
                  return Column(
                    children: [
                      VisitItem(
                        date:
                            DateFormat('MMM dd').format(booking.date.toDate()),
                        time: DateFormat('EEE. HH:mm')
                            .format(booking.date.toDate()),
                        child: CustomProfileItem(
                          onTap: () {
                            // Navigator.of(context).pushNamed(Routes.visitDetail);
                          },
                          title: doctor.fullName,
                          subtitle: healthCategories
                                  .firstWhere((element) =>
                                      element.id == doctor.idSpeciality)
                                  .name ??
                              "",
                          buttonTitle: 'See Full Reports',
                          imagePath: '${doctor.avatar}',
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class VisitItem extends StatelessWidget {
  final String date;
  final String time;
  final Widget child;

  const VisitItem({
    Key? key,
    required this.date,
    required this.time,
    required this.child,
  }) : super(key: key);

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
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(child: child),
      ],
    );
  }
}
