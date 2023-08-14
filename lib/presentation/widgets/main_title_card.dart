import 'package:flutter/material.dart';

import '../../core/constant/screen_size.dart';
import '../../core/constant/space.dart';

import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: (title),
        ),
        verticalSpace(ScreenSize.screenHeight / 100),
        LimitedBox(
          maxHeight: ScreenSize.screenHeight / 4,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => HomeMainCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
