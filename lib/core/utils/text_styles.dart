import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';

class TextStyles {
  static TextStyle mainLabel = GoogleFonts.dmSans(
    color: AppColors.secundaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 35.fS,
  );
  static TextStyle text = GoogleFonts.dmSans(
    color: AppColors.grayColor,
    fontWeight: FontWeight.w400,
    fontSize: 15.fS,
  );

  static TextStyle blueText = GoogleFonts.dmSans(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 17.fS,
  );
}
