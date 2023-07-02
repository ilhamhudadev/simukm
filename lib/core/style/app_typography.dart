import 'package:flutter/material.dart';
import 'package:standard_project/core/style/app_color.dart';

class AppTypography {
  static TextStyle title({Color color = AppColors.bodytext}) {
    return TextStyle(
      fontSize: 14.0,
      fontFamily: 'nunito',
      letterSpacing: 0.12,
      height: 1.4,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle caption({Color color = AppColors.bodytext}) {
    return TextStyle(
      fontSize: 12.0,
      fontFamily: 'nunito',
      letterSpacing: 0.12,
      height: 1.33,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}
