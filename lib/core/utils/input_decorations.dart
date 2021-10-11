import 'package:flutter/material.dart';
import 'package:take_home_project/core/theme/app_colors.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: AppColors.secundaryColor,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: AppColors.primaryColor)
          : null,
    );
  }
}
