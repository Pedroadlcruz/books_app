import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/utils/text_styles.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    Widget? suffix,
  }) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            // width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      hintText: hintText,
      hintStyle: TextStyles.text,
      labelText: labelText,
      labelStyle: TextStyles.text,
      suffix: suffix,
      // contentPadding: EdgeInsets.all(15),
    );
  }
}
