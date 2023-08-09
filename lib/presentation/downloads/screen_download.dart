import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
              child: Text(
        'downloads page',
        style: TextStyle(color: Colors.white),
      ))),
    );
  }
}
