import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medapp/components/splash_widget.dart';
import '../data/pref_manager.dart';
import '../routes/routes.dart';
import '../utils/app_themes.dart';
import '../utils/themebloc/theme_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _loadScreen());
  }

  _loadScreen() async {
    await Prefs.load();
    context.read<ThemeBloc>().add(ThemeChanged(
        theme: Prefs.getBool(Prefs.DARKTHEME, def: false)
            ? AppTheme.DarkTheme
            : AppTheme.LightTheme));
    Navigator.of(context).pushReplacementNamed(Routes.wrapper);
  }

  @override
  Widget build(BuildContext context) {
    return SplashWidget();
  }
}
