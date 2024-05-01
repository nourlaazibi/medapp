import 'package:flutter/material.dart';

import '../../../data/pref_manager.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;
  final String hint;
  final String? trailing;

  const ProfileInfoTile({
    Key? key,
    required this.title,
    required this.hint,
    this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _isDark = Prefs.isDark();
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            trailing ?? hint,
            style: TextStyle(
              color: trailing != null
                  ? _isDark
                      ? Colors.white.withOpacity(0.87)
                      : Colors.black
                  : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(
          height: 0.5,
          color: Colors.grey[200],
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
