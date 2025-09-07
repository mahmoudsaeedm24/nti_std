import 'package:flutter/material.dart';
import 'package:m_emad/core/app_settings/routes.dart';
import 'package:m_emad/features/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,

      ///* you can set your feature screen here
      ///* don't change anything else
      home: HomeScreen(),
    );
  }
}
