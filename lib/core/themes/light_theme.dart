import 'package:flutter/material.dart';
import 'package:notely/core/themes/app_colors.dart';

class LightTheme{
  static final textTheme = TextTheme().apply(
    fontFamily: 'Nunito',
    displayColor: AppColors.darkLight,
    bodyColor: AppColors.darkLight,
    decorationColor: AppColors.darkLight,
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: TextStyle(
          fontSize: 20,
          fontWeight:FontWeight.w900,
          ),
          minimumSize: const Size(double.infinity, 74),
      ),
  );

  static final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.white,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.orange,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.red,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.white,
        width: 1,
      ),
    ),
  );

  static final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.orange,
        error: AppColors.red,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      elevatedButtonTheme: elevatedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
  );
}
