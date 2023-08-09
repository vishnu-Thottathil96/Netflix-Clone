import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';

class ScreenNewsHot extends StatelessWidget {
  const ScreenNewsHot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
              child: Text(
        'News and hot page',
        style: TextStyle(color: Colors.white),
      ))),
    );
  }
}
