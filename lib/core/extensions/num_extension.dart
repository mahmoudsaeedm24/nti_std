import 'package:m_emad/core/responsive/device_screen_info.dart';

extension AppDistance on num {
  ///* 3.92
  get w => DeviceScreenInfo.screenWidth * (this / 100);

  ///* 8.57
  get h => DeviceScreenInfo.screenHeight * (this / 100);
  get sp => DeviceScreenInfo.textCalc * (this / 100);
}
