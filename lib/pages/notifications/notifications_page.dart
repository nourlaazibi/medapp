import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../model/notification.dart';
import 'widgets/notification_list_item.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr()),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          indent: 0,
          endIndent: 0,
        ),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationListItem(
            notification: notifications[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
