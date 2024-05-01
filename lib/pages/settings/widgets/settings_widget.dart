import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class SettingsWidget extends StatefulWidget {
  final Color color;

  const SettingsWidget({Key? key, required this.color}) : super(key: key);
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _healthTips = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          padding: EdgeInsets.all(15),
          child: Text(
            'settings'.tr(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SwitchListTile(
          value: _healthTips,
          onChanged: (_) {
            setState(() {
              _healthTips = !_healthTips;
            });
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'health_tips_for_you'.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'get_information_tips'.tr(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Text(
            'notification_settings'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          onTap: () =>
              Navigator.of(context).pushNamed(Routes.notificationSettings),
        ),
      ],
    );
  }
}
