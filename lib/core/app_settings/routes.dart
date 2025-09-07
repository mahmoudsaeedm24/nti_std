import 'package:flutter/material.dart';


///! (warning) don't change attributes here

class Screens {
  Screens._();

  static const String home = '/';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    Screens.home => MaterialPageRoute(builder: (context) => Scaffold()),
    _ => MaterialPageRoute(builder: (context) => Scaffold()),
  };
}
