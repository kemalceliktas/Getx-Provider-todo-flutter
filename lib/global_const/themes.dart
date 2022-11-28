import 'dart:ui';

import 'package:flutter/material.dart';

class LightTheme {
  ThemeData themeLight = ThemeData.light().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: LigthColor().bgColor,
      selectedItemColor: LigthColor().buttonColor,
      
    ),

    scaffoldBackgroundColor: LigthColor().bgColor,
    appBarTheme: AppBarTheme(
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      color: LigthColor().iconColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
    
    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            color: LigthColor().iconColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 1.2,
            letterSpacing: 1.5,
          ),
          headline2: TextStyle(
            color:  DarkColor().cardTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 1.2,
            letterSpacing: 1.5,
          ),
         
          subtitle1: TextStyle(
            color:  DarkColor().cardTextColor.withOpacity(0.8),
            fontWeight: FontWeight.w800,
            fontSize: 16,
            height: 1.2,
            letterSpacing: 1.5,
          ),
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );


  ThemeData themeDark = ThemeData.dark().copyWith(
    
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: DarkColor().scaffoldBg,
      selectedItemColor: LigthColor().buttonColor,
      
    ),
    scaffoldBackgroundColor: DarkColor().scaffoldBg,
    appBarTheme: AppBarTheme(
      
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      color: DarkColor().bgColor,
      iconTheme: IconThemeData(
        color: LigthColor().buttonColor,
      )
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
    
    
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: TextStyle(
            color: DarkColor().textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 1.2,
            letterSpacing: 1.5,
          ),
         
           headline2: TextStyle(
            color:  DarkColor().cardTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 1.2,
            letterSpacing: 1.5,
          ),
         
          subtitle1: TextStyle(
            color:  DarkColor().cardTextColor.withOpacity(0.8),
            fontWeight: FontWeight.w800,
            fontSize: 16,
            height: 1.2,
            letterSpacing: 1.5,
          ),
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );
}

class LigthColor {
  final Color _textColor = Colors.blueGrey;
  final Color bgColor = Color(0xFFEFF5F5);
  final Color cardColor = Color(0xFFD6E4E5);
  final Color iconColor = Color(0xFF497174);
  final Color buttonColor = Color(0xFFEB6440);
}


class DarkColor {
  final Color bgColor =Color(0xFF222831);
  final Color textColor = Color(0xffEEEEEE);
  final Color buttonColor = Color(0xff00ADB5);
  final Color scaffoldBg =Color(0xFF393E46);
  final Color cardTextColor = Color(0xFF222831);


}
