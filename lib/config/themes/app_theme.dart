import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.textBlack,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    textTheme:  const TextTheme(
      bodyMedium:  TextStyle(
        color: Colors.white,
        fontSize: 22,
        letterSpacing: 1.3,
        fontWeight: FontWeight.w400,
      ),
    ));
}