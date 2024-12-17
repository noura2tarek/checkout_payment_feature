import 'package:flutter/material.dart';
import '../colors/colors.dart';

abstract class AppStyles {
  static const String fontFamily = 'Inter';
  // style 25
  static const TextStyle styleMedium25 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 25.0,
  );
  // style 24
  static TextStyle styleSemiBold24({Color color = AppColors.black}) =>
      TextStyle(
        fontWeight: FontWeight.w600,
        color: color,
        fontFamily: fontFamily,
        fontSize: 24.0,
      );
  // style 22
  static const TextStyle styleMedium22 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 22.0,
  );
  // style 20 med
  static const TextStyle styleMedium20 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 20.0,
  );
  // style 20 normal
  static const TextStyle styleRegular20 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 20.0,
  );

  // style 18 regular
  static const TextStyle style18 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 18.0,
  );
  // style 24
  static const TextStyle styleSemiBold18 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: fontFamily,
    fontSize: 18.0,
  );
  //style 16
  static const TextStyle style16 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontFamily: fontFamily,
    fontSize: 16.0,
    height: 0.5,
  );
}
