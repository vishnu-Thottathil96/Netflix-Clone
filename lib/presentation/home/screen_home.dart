import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/presentation/home/widgets/appbar_homepage.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_titlecard.dart';
import '../widgets/main_title_card.dart';

String homeMainImage =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nrmXQ0zcZUL8jFLrakWc90IR8z9.jpg';
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              return true;
            },
            child: Stack(
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const BackgroundCard(),
                    const MainTitleCard(title: 'Now Playing'),
                    verticalSpace(ScreenSize.screenHeight / 40),
                    const MainTitleCard(
                      title: 'Popular',
                    ),
                    verticalSpace(ScreenSize.screenHeight / 40),
                    const NumberTitleCard(),
                    verticalSpace(ScreenSize.screenHeight / 40),
                    const MainTitleCard(
                      title: 'Upcoming',
                    ),
                    verticalSpace(ScreenSize.screenHeight / 40),
                    const MainTitleCard(
                      title: 'Top Rated',
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? const CostomisedDisapearingAppBar()
                    : verticalSpace(ScreenSize.screenHeight / 12)
              ],
            ),
          );
        },
      ),
    );
  }
}
