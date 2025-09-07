import 'package:flutter/material.dart';

enum ColorPallete { pink, lightGreen, cyan, lightBlue, deepOrange, def}

class AppColors {
  AppColors._();
  static const Color pink = Colors.pink;
  static const Color lightGreen = Colors.lightGreen;
  static const Color cyan = Colors.cyan;
  static const Color lightBlue = Colors.lightBlue;
  static const Color deepOrange = Colors.deepOrangeAccent;
  static const Color def = Colors.white54;

  static Color getColor({required ColorPallete colorPallte}) {
    return switch (colorPallte.name) {
      "pink" => AppColors.pink,
      "lightGreen" => AppColors.lightGreen,
      "cyan" => AppColors.cyan,
      "ligthBlue" => AppColors.lightBlue,
      "deepOrange" => AppColors.deepOrange,
      "def" => AppColors.def,

      _ => const Color.fromARGB(255, 143, 143, 143)
    };
  }
}
