import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/services/db/notification_db.dart';

import '../../model/notification.dart';

import 'widgets/notification_list_item.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<MyNotification> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    NotificationDB notificationDB = NotificationDB();
    List<MyNotification> fetchedNotifications = await notificationDB.fetchAllNotifications();
    setState(() {
      notifications = fetchedNotifications;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr()),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : notifications.isEmpty
              ? Center(child: Text('No notifications found'))
              : ListView.separated(
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
