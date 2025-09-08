import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m_emad/core/color_pallete.dart';
import 'package:m_emad/core/extensions/num_extension.dart';
import 'package:m_emad/core/model/person_model.dart';

class DetailsScreen extends StatefulWidget {
  final List<Person> persons;
  final int currentIndex;

  const DetailsScreen({
    super.key,
    required this.persons,
    required this.currentIndex,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  Timer? _timer;
  bool isPlaying = false;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      nextPerson(auto: true);
    });
    setState(() {
      isPlaying = true;
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      isPlaying = false;
    });
  }

  void toggleTimer() {
    if (isPlaying) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void nextPerson({bool auto = false}) {
    setState(() {
      int nextIndex = (currentIndex + 1) % widget.persons.length;
      _animateTo(nextIndex, const Offset(1, 0));
    });
  }

  void previousPerson() {
    setState(() {
      int prevIndex =
          (currentIndex - 1 + widget.persons.length) % widget.persons.length;
      _animateTo(prevIndex, const Offset(-1, 0));
    });
  }

  void _animateTo(int newIndex, Offset direction) {
    _offsetAnimation = Tween<Offset>(
      begin: direction,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.reset();
    _controller.forward();

    currentIndex = newIndex;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final person = widget.persons[currentIndex];

    return Scaffold(
      backgroundColor: AppColors.getColor(colorPallte: person.screenColor),
      appBar: AppBar(
        title: Text(person.name),
        centerTitle: true,
        backgroundColor: AppColors.getColor(colorPallte: person.screenColor),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                person.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          person.image!,
                          height: 40.w,
                          width: 40.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(height: 10),
                const SizedBox(height: 20),
                Text(
                  person.name,
                  softWrap: false,
                  style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: person.message.split('.').map((p) {
                    return Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 10),
                      child: Text(
                        '$p.',
                        style: TextStyle(fontSize: 4.sp),
                        textAlign: TextAlign.justify,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 9.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(131, 1, 32, 47),
        ),
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              mini: true,
              heroTag: "close",
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            ),
            FloatingActionButton(
              mini: true,
              heroTag: "previous",
              onPressed: () => previousPerson(),
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              mini: true,
              heroTag: "next",
              onPressed: () => nextPerson(),
              child: const Icon(Icons.arrow_forward),
            ),

            FloatingActionButton(
              mini: true,
              heroTag: "playpause",
              onPressed: toggleTimer,
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
