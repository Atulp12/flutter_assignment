import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/theme/app_color.dart';

class AppTheme {
  static final theme = ThemeData(fontFamily: 'Montserrat').copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.blackColor),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.blackColor, width: 1),
            borderRadius: BorderRadius.zero),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.blackColor, width: 1.5),
            borderRadius: BorderRadius.zero),
      ));
}
