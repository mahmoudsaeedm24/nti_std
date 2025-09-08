import 'package:flutter/material.dart';
import 'package:m_emad/core/app_settings/routes.dart';
import 'package:m_emad/core/extensions/num_extension.dart';
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
      theme: ThemeData(
        fontFamily: 'Cairo',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 4.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      ///* you can set your feature screen here
      ///* don't change anything else
      home: HomeScreen(),
    );
  }
}
