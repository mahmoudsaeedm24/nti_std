import 'package:flutter/material.dart';

enum ColorPallete { cyan, pink, lightGreen, lightBlue, deepOrange, def, purple }

class AppColors {
  AppColors._();
  static const Color cyan = Colors.cyan;
  static const Color pink = Colors.pink;
  static const Color purple = Color.fromARGB(255, 230, 210, 255);
  static const Color lightGreen = Colors.lightGreen;
  static const Color lightBlue = Colors.lightBlue;
  static const Color deepOrange = Colors.deepOrangeAccent;
  static const Color def = Color.fromARGB(218, 153, 152, 152);

  static Color getColor({required ColorPallete colorPallte}) {
    return switch (colorPallte.name) {
      "pink" => AppColors.pink,
      "purple" => AppColors.purple,
      "lightGreen" => AppColors.lightGreen,
      "cyan" => AppColors.cyan,
      "ligthBlue" => AppColors.lightBlue,
      "deepOrange" => AppColors.deepOrange,
      "def" => AppColors.def,

      _ => const Color.fromARGB(255, 143, 143, 143),
    };
  }
}
