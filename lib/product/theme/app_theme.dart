import 'package:flutter/material.dart';
import 'package:lest/core/extensions/color_extensions.dart';
import 'package:lest/product/theme/custom_colors.dart';

mixin AppTheme {
  static ThemeData get themeData => ThemeData(
        primarySwatch: CustomColors.primaryColor.materialColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          headlineLarge: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),
          headlineSmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
        ),
        indicatorColor: CustomColors.secondaryColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: CustomColors.secondaryColor,
        ),
      );
}
