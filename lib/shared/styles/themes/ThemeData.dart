import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/styles/colors.dart';

ThemeData darkTheme =ThemeData(
  primarySwatch: defualtColor(),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w900,
        fontFamily: 'Soka'
    ),

    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
        statusBarIconBrightness: Brightness.light
    ),
    backwardsCompatibility: false,
    backgroundColor: Colors.grey,
    elevation: 0,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey,
  fontFamily: 'Soka',
) ;

ThemeData LightTheme = ThemeData(
  primarySwatch: defualtColor(),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 21,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w900,
        fontFamily: 'Soka'
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ),
    backwardsCompatibility: false,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defualtColor(),
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'Soka',
);