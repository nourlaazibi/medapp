import 'package:flutter/material.dart';

import '../../components/history_appointments_list_item.dart';

class HistoryAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemCount: 2,
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 15,
      ),
      itemBuilder: (context, index) {
        return HistoryAppointmentListItem();
      },
    );
  }
}
