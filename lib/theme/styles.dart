import 'package:flutter/material.dart';

import 'colors.dart';

TextTheme get textTheme => const TextTheme(
      displayLarge: TextStyle(
        fontSize: 99,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: AppColors.formFieldText,
      ),
      displayMedium: TextStyle(
        fontSize: 62,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.formFieldText,
      ),
      displaySmall: TextStyle(
        fontSize: 49,
        fontWeight: FontWeight.w400,
        color: AppColors.formFieldText,
      ),
      headlineMedium: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.formFieldText,
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.formFieldText,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        color: AppColors.formFieldText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.formFieldText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.36,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.formFieldText,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.18,
        color: AppColors.formFieldText,
      ),
    );

// To add custom text theme name
extension CustomStyles on TextTheme {
  TextStyle get buttonStyle {
    return const TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get error {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get success {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    );
  }
}
