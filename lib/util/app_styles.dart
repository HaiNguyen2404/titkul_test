import 'package:flutter/material.dart';
import 'package:titkul_test/util/app_colors.dart';

class AppStyles {
  static const titleSmall = TextStyle(color: Colors.white, fontSize: 14);

  static const titleSmallBold = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const titleSmallBlack = TextStyle(color: Colors.black, fontSize: 13);
  static const titleSmallGrey =
      TextStyle(color: AppColors.subtleDark, fontSize: 13);

  static const titleSmallBlack11 = TextStyle(color: Colors.black, fontSize: 13);
  static const titleSmallGrey11 =
      TextStyle(color: AppColors.subtleDark2, fontSize: 13);

  static const titleSmallBlue = TextStyle(
    color: AppColors.primary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const titleMedBoldBlue = TextStyle(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const titleMedBoldBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const titleSmallGreen = TextStyle(
    color: Colors.green,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}
