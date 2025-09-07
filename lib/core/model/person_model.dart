import 'package:m_emad/core/color_pallete.dart';

class Person {
  final String name;
  final String? image;
  final String message;
  final ColorPallete screenColor;

  Person({
    required this.name,
    this.image,
    this.screenColor = ColorPallete.def,
    required this.message,
  });
}
