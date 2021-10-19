import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/theme/text_styles.dart';

class InputDecorations {
  ///
  /// An app TextFormField [Custom Decoration]
  ///
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    Widget? suffix,
    Widget? preffix,
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
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      hintText: hintText,
      hintStyle: TextStyles.text,
      labelText: labelText,
      labelStyle: TextStyles.text,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: suffix,
      ),
      prefixIcon: preffix,
    );
  }
}
