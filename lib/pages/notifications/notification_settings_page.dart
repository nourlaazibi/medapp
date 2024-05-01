import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  var _allNotifications;
  var _campain, _pm, _alerts, _appointments, _healthTips, _reminders, _updates;

  @override
  void initState() {
    super.initState();
    _allNotifications = true;
    _campain = true;
    _pm = true;
    _alerts = true;
    _appointments = true;
    _healthTips = true;
    _reminders = true;
    _updates = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'notification_settings'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              value: _allNotifications,
              onChanged: (_) {
                setState(() {
                  _allNotifications = !_allNotifications;
                });
              },
              title: Text(
                'all_notifications'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CheckboxListTile(
              value: _campain,
              onChanged: _allNotifications
                  ? (value) {
                      if (!_allNotifications) return;
                      setState(() {
                        _campain = !_campain;
                      });
                    }
                  : null,
              title: Text(
                'campain_messages'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _pm,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _pm = !_pm;
                      });
                    }
                  : null,
              title: Text(
                'conversation_messages'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _alerts,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _alerts = !_alerts;
                      });
                    }
                  : null,
              title: Text(
                'alerts'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _appointments,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _appointments = !_appointments;
                      });
                    }
                  : null,
              title: Text(
                'appointments'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _healthTips,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _healthTips = !_healthTips;
                      });
                    }
                  : null,
              title: Text(
                'health_tips'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _reminders,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _reminders = !_reminders;
                      });
                    }
                  : null,
              title: Text(
                'reminders_and_records'.tr(),
              ),
            ),
            Divider(),
            CheckboxListTile(
              value: _updates,
              onChanged: _allNotifications
                  ? (value) {
                      setState(() {
                        _updates = !_updates;
                      });
                    }
                  : null,
              title: Text(
                'updates_and_offers'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
