import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/pref_manager.dart';
import '../../utils/app_themes.dart';
import '../../utils/constants.dart';
import '../../utils/themebloc/theme_bloc.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  bool _isDark = Prefs.isDark();
  late Color _color;

  @override
  void initState() {
    _color = _isDark ? kColorDark : Colors.grey[50]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SettingsWidget(
                color: _color,
              ),
              GeneralWidget(
                isDark: _isDark,
                onDarkPressed: (darkTheme) {
                  setState(() {
                    _isDark = darkTheme;
                    Prefs.setBool(Prefs.DARKTHEME, darkTheme);
                    context.read<ThemeBloc>().add(ThemeChanged(
                        theme: darkTheme
                            ? AppTheme.DarkTheme
                            : AppTheme.LightTheme));
                    _color = _isDark ? kColorDark : Colors.grey[50]!;
                  });
                },
              ),
              AccountWidget(
                color: _color,
              ),
              SizedBox(
                height: kBottomPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
