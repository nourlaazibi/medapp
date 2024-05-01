import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: Colors.white,
    toggleableActiveColor: kColorPrimary,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: kColorPrimary,
      ),
      actionsIconTheme: IconThemeData(
        color: kColorPrimary,
      ),
      titleTextStyle: TextStyle(
        color: kColorDarkBlue,
        fontFamily: 'NunitoSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      button: kTextStyleButton,
      subtitle1: kTextStyleSubtitle1.copyWith(color: kColorPrimaryDark),
      subtitle2: kTextStyleSubtitle2.copyWith(color: kColorPrimaryDark),
      bodyText2: kTextStyleBody2.copyWith(color: kColorPrimaryDark),
      headline6: kTextStyleHeadline6.copyWith(color: kColorPrimaryDark),
    ),
    iconTheme: IconThemeData(
      color: kColorPrimary,
    ),
    fontFamily: 'NunitoSans',
    cardTheme: CardTheme(
      elevation: 0,
      color: Color(0xffEBF2F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        //side: BorderSide(width: 1, color: Colors.grey[200]),
      ),
    ),
  ),
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: Colors.black,
    toggleableActiveColor: kColorPrimary,
    colorScheme: ColorScheme.dark(secondary: kColorPrimary),
    appBarTheme: AppBarTheme(
      color: Color(0xff121212),
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kColorDark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        //color: Colors.white.withOpacity(0.87),
        color: kColorPrimary,
      ),
      actionsIconTheme: IconThemeData(
        //color: Colors.white.withOpacity(0.87),
        color: kColorPrimary,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'NunitoSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white54,
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      button: kTextStyleButton,
      subtitle1:
          kTextStyleSubtitle1.copyWith(color: Colors.white.withOpacity(0.87)),
      subtitle2:
          kTextStyleSubtitle2.copyWith(color: Colors.white.withOpacity(0.87)),
      bodyText2:
          kTextStyleBody2.copyWith(color: Colors.white.withOpacity(0.87)),
      headline6:
          kTextStyleHeadline6.copyWith(color: Colors.white.withOpacity(0.87)),
    ),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.87),
    ),
    fontFamily: 'NunitoSans',
    cardTheme: CardTheme(
      elevation: 0,
      color: kColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.87),
        ),
      ),
    ),
  ),
};
