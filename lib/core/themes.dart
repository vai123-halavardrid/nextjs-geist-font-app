import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF0D47A1);
final Color secondaryColor = Color(0xFFFFA000);
final Color backgroundColor = Color(0xFFF5F5F5);
final Color cardColor = Colors.white;

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
  ),
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor),
    bodyText1: TextStyle(fontSize: 16, color: Colors.black87),
    bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      elevation: 4,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor, width: 2),
    ),
  ),
  cardTheme: CardTheme(
    color: cardColor,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: EdgeInsets.all(12),
  ),
);
