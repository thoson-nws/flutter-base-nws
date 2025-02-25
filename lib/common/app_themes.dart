import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  //Font
  static String lightFont = "Arimo";
  static String darkFont = "Arimo";

  //Primary
  static const Color _lightPrimaryColor = Color(0xffffffff);
  static const Color _darkPrimaryColor = Color(0xFF1a222d);

  //Secondary
  // static const Color _lightSecondaryColor = Color(0xFFd74315);
  // static const Color _darkSecondaryColor = Color(0xFFd74315);

  //Background
  static const Color _lightBackgroundColor = Color(0xffffffff);
  static const Color _darkBackgroundColor = Color(0xFF1a222d);

  //Text
  static const Color _lightTextColor = Color(0xff000000);
  static const Color _darkTextColor = Color(0xffffffff);

  //Border
  // static const Color _lightBorderColor = Colors.grey;
  // static const Color _darkBorderColor = Colors.grey;

  //Icon
  static const Color _lightIconColor = Color(0xff000000);
  static const Color _darkIconColor = Color(0xffffffff);

  //Text themes
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 96.0, color: _lightTextColor),
    headline2: TextStyle(fontSize: 60.0, color: _lightTextColor),
    headline3: TextStyle(fontSize: 48.0, color: _lightTextColor),
    headline4: TextStyle(fontSize: 34.0, color: _lightTextColor),
    headline5: TextStyle(fontSize: 24.0, color: _lightTextColor),
    headline6: TextStyle(
        fontSize: 20.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    subtitle1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    subtitle2: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: _lightTextColor),
    button: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    caption: TextStyle(fontSize: 12.0, color: _lightTextColor),
    overline: TextStyle(fontSize: 14.0, color: _lightTextColor),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 96.0, color: _darkTextColor),
    headline2: TextStyle(fontSize: 60.0, color: _darkTextColor),
    headline3: TextStyle(fontSize: 48.0, color: _darkTextColor),
    headline4: TextStyle(fontSize: 34.0, color: _darkTextColor),
    headline5: TextStyle(fontSize: 24.0, color: _darkTextColor),
    headline6: TextStyle(
        fontSize: 20.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    subtitle1: TextStyle(fontSize: 16.0, color: _darkTextColor),
    subtitle2: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: _darkTextColor),
    button: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    caption: TextStyle(fontSize: 12.0, color: _darkTextColor),
    overline: TextStyle(fontSize: 14.0, color: _darkTextColor),
  );

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    fontFamily: darkFont,
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: _lightBackgroundColor,
      iconTheme: IconThemeData(color: _lightIconColor),
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
  );

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    fontFamily: darkFont,
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: _darkBackgroundColor,
      iconTheme: IconThemeData(color: _darkIconColor),
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    textTheme: _darkTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
  );
}
