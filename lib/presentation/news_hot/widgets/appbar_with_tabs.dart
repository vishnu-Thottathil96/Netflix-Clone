import 'package:flutter/material.dart';
import 'package:netflix/core/constant/screen_size.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/space.dart';

class AppBarNewandHot extends StatelessWidget {
  const AppBarNewandHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'New & Hot',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
      actions: [
        Row(
          children: [
            Icon(
              Icons.cast,
              color: Colors.white,
              size: ScreenSize.screenHeight / 33,
            ),
            horizontalSpace(
              ScreenSize.screenHeight / 100,
            ),
            SizedBox(
              height: ScreenSize.screenHeight / 30,
              width: ScreenSize.screenHeight / 30,
              child: Image.asset(
                'assets/lmages/appbarlogo.png',
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(
              ScreenSize.screenHeight / 100,
            ),
          ],
        ),
      ],
      bottom: const TabBar(
        isScrollable: true,
        unselectedLabelColor: whiteColor,
        unselectedLabelStyle:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        labelColor: blackColor,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        indicator: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        tabs: [
          Tab(
            text: '🍿 Coming Soon',
          ),
          Tab(text: '👀 Everyone\'s Watching'),
        ],
      ),
    );
  }
}
