import 'package:flutter/material.dart';

import '../../../data/pref_manager.dart';
import '../../../utils/constants.dart';

class NavBarItemWidget extends StatelessWidget {
  final void Function() onTap;
  final String image;
  final bool isSelected;

  const NavBarItemWidget({
    Key? key,
    required this.onTap,
    required this.image,
    required this.isSelected,
  }) : super(key: key);

  Color get _color => isSelected
      ? kColorPrimary
      : Prefs.isDark()
          ? Colors.grey[800]!
          : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Center(
          child: image.isEmpty
              ? Container()
              : Image.asset(
                  'assets/images/$image.png',
                  height: 25,
                  color: _color,
                ),
        ),
      ),
    );
  }
}
