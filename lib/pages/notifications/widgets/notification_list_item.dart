import 'package:flutter/material.dart';

import '../../../data/pref_manager.dart';
import '../../../model/notification.dart' as notif;

class NotificationListItem extends StatelessWidget {
  final notif.Notification notification;
  final void Function() onTap;

  const NotificationListItem({
    Key? key,
    required this.notification,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Prefs.isDark();

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        child: Row(
          children: <Widget>[
            Image.asset(notification.icon!),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notification.title!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    notification.body! + '\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              notification.date!,
              style: TextStyle(
                color: isDark
                    ? Colors.white.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
