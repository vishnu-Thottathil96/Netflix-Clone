import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
              child: Text(
        'search page',
        style: TextStyle(color: Colors.white),
      ))),
    );
  }
}
