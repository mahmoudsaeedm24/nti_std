import 'package:flutter/material.dart';

class DeviceScreenInfo {
  DeviceScreenInfo._();
  static final myWindow =
      WidgetsBinding.instance.platformDispatcher.views.first;
  static MediaQueryData mediaQueryData = MediaQueryData.fromView(myWindow);

  static final screenWidth = mediaQueryData.size.width;
  static final screenHeight = mediaQueryData.size.height;
  static final textCalc = mediaQueryData.size.shortestSide;
  static final Brightness deviceBrightness = mediaQueryData.platformBrightness;
  static final deviceLanguage = myWindow.platformDispatcher.locale;

  static textCal() {}

}
