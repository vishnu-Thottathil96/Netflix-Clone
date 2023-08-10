import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
              child: Text(
        'FastLaughs page',
        style: TextStyle(color: Colors.white),
      ))),
    );
  }
}
