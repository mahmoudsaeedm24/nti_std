import 'package:flutter/material.dart';

class Person {
  final String name;
  final String? image;
  final String message;
  final Color screenColor;

  Person({
    required this.name,
    this.image,
    this.screenColor = const Color(0xff00ADB5),
    required this.message,
  });
}
