import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_titlecard.dart';
import '../../core/constant/text_theme.dart';
import '../widgets/app_bar_widget.dart';
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
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(microseconds: 3000),
                        color: Colors.black.withOpacity(0.5),
                        width: double.infinity,
                        height: ScreenSize.screenHeight / 11,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image:
                                      const AssetImage('assets/lmages/N.png'),
                                  height: ScreenSize.screenHeight / 16,
                                  width: ScreenSize.screenHeight / 16,
                                ),
                                const Spacer(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: homeTitleText),
                                Text('Movies', style: homeTitleText),
                                Text('Categories', style: homeTitleText),
                              ],
                            ),
                          ],
                        ),
                      )
                    : verticalSpace(ScreenSize.screenHeight / 12)
              ],
            ),
          );
        },
      ),
    );
  }
}
