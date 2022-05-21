import 'package:detgas_1/config/palette.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color.fromRGBO(29, 161, 242, 1);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);

  static String font1 = "ProductSans";
  static String font2 = "Roboto";
  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = Palette.primaryColor;

  //Background Colors
  static const Color _lightBackgroundColor = whiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;
  static const Color _lightBackgroundSecondaryColor = white;
  static const Color _lightBackgroundAlertColor = blackPearl;
  static const Color _lightBackgroundErrorColor = brinkPink;
  static const Color _lightBackgroundSuccessColor = juneBud;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  static const Color _lightAlertTextColor = Colors.black;
  static const Color _lightTextSecondaryColor = Colors.black;

  //Border Color
  static const Color _lightBorderColor = Palette.primaryColor;

  //Icon Color
  static const Color _lightIconColor = Palette.primaryColor;

  //form input colors
  static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = Palette.primaryColor;
  static const Color _lightBorderErrorColor = brinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = dodgerBlue;

  //Background Colors
  static const Color _darkBackgroundColor = ebonyClay;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = Colors.black;
  static const Color _darkBackgroundErrorColor =
      Color.fromRGBO(255, 97, 136, 1);
  static const Color _darkBackgroundSuccessColor =
      Color.fromRGBO(186, 215, 97, 1);

  //Text Colors
  static const Color _darkTextColor = Colors.white;
  static const Color _darkAlertTextColor = Colors.black;
  static const Color _darkTextSecondaryColor = Colors.black;

  //Border Color
  static const Color _darkBorderColor = nevada;

  //Icon Color
  static const Color _darkIconColor = nevada;

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = brinkPink;

  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 20.0, color: _lightTextColor),
    bodyText1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey),
    button: TextStyle(
        fontSize: 15.0, color: _lightTextColor, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _darkTextColor),
    subtitle1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    caption: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font1,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.primaryColor,
      iconTheme: IconThemeData(color: _darkTextColor),
      textTheme: _lightTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightBackgroundColor,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme:
        SnackBarThemeData(backgroundColor: _lightBackgroundAlertColor),
    iconTheme: IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: Palette.primaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );
}
