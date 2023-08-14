import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/presentation/home/widgets/number_titlecard.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainTitleCard(title: 'Released in the Past year'),
            verticalSpace(ScreenSize.screenHeight / 40),
            const MainTitleCard(
              title: 'Trending Now',
            ),
            verticalSpace(ScreenSize.screenHeight / 40),
            //
            const NumberTitleCard(),
            //
            verticalSpace(ScreenSize.screenHeight / 40),
            const MainTitleCard(
              title: 'Tense Dramas',
            ),
            verticalSpace(ScreenSize.screenHeight / 40),
            const MainTitleCard(
              title: 'South Indian Cinema',
            ),
          ],
        ),
      ),
    );
  }
}
