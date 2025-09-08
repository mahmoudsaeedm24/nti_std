import 'package:flutter/material.dart';
import 'package:m_emad/core/color_pallete.dart';
import 'package:m_emad/core/extensions/num_extension.dart';

import 'data_source.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NTI Trainees - Batch 2, 8-2025")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailsScreen(persons: persons, currentIndex: index),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.getColor(
                  colorPallte:
                      ColorPallete.values[(index) % ColorPallete.values.length],
                ),

                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                persons[index].name,
                style: TextStyle(fontSize: 3.sp, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
