import 'package:flutter/material.dart';

class AppSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    if (_mediaQueryData.size.width <= 500) {
      screenWidth = _mediaQueryData.size.width;
    } else {
      screenWidth = 500;
    }

    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = AppSize.screenHeight;
    return (inputHeight / 812.0) * screenHeight;
  }

  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = AppSize.screenWidth;
    return (inputWidth / 375.0) * screenWidth;
  }
}
