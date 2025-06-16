import 'package:flutter/material.dart';
import 'package:soptify/core/config/theme/app_color.dart';


class AppTheme {

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(25),
          hintStyle: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
          border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      )
    )
  );


  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(25),
          hintStyle: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      )
    )
  );

}