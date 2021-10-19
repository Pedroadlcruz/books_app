import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';

///
/// All App custom [TextStyle]
///
class TextStyles {
  /// fontSize [35], fontWeight[700]
  static TextStyle mainLabel = GoogleFonts.dmSans(
    color: AppColors.secundaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 35.fS,
  );

  /// fontSize [15], fontWeight[400], text color[Gray]
  static TextStyle text = GoogleFonts.dmSans(
    color: AppColors.grayColor,
    fontWeight: FontWeight.w400,
    fontSize: 15.fS,
  );

  /// fontSize [17], fontWeight[700], text color[Primary Blue]
  static TextStyle blueText = GoogleFonts.dmSans(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 17.fS,
  );
}
