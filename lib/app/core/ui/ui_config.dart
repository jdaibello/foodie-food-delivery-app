import 'package:flutter/material.dart';

class UIConfig {
  UIConfig._();

  static String get title => 'Foodie - Food Delivery App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'NotoSans',
        backgroundColor: const Color(0xFFE5E5E5),
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
        primaryColor: const Color(0xFFEC5359),
        primaryColorLight: const Color(0xFFFF6869),
        primaryColorDark: const Color(0xFFEC5359),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE5E5E5),
        ),
        textTheme: const TextTheme().apply(
          bodyColor: const Color(0xFFE5E5E5),
          displayColor: const Color(0xFFE5E5E5),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color(0xFFF55D61),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFE2E2E2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFF55D61),
            ),
          ),
        ),
      );
}
