import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/controller/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/listenables.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/models/model_movie.dart';
import 'package:netflix/view/home/widgets/appbar_homepage.dart';
import 'package:netflix/view/home/widgets/background_card.dart';
import 'package:netflix/view/home/widgets/number_titlecard.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  Future<void> initData() async {
    await getAlldata();
    getRandomMovie();
  }

  getAlldata() async {
    nowPlayingNotifier.value = await Api().getNowPlaying();
    popularNotifier.value = await Api().getPopular();
    upcomingNotifier.value = await Api().getUpcoming();
    topRatedNotifier.value = await Api().getTopMovies();
    topTenNotifier.value = await Api().top10InIndiaToday();
  }

  getRandomMovie() {
    Random random = Random();
    int randomIndex = random.nextInt(topRatedNotifier.value.length);

    randomNotifier.value = popularNotifier.value[randomIndex].posterPath;
  }

  @override
  Widget build(BuildContext context) {
    // getAlldata();
    // getRandomMovie();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<void>(
        future: initData(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder(
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
                          ValueListenableBuilder(
                            valueListenable: randomNotifier,
                            builder: (context, value, _) {
                              return BackgroundCard(movieUrl: value);
                            },
                          ),
                          MainTitleCard(
                              title: 'Now Playing',
                              valueNotifier: nowPlayingNotifier),
                          verticalSpace(ScreenSize.screenHeight / 40),
                          MainTitleCard(
                            title: 'Popular',
                            valueNotifier: popularNotifier,
                          ),
                          verticalSpace(ScreenSize.screenHeight / 40),
                          const NumberTitleCard(),
                          verticalSpace(ScreenSize.screenHeight / 40),
                          MainTitleCard(
                            title: 'Upcoming',
                            valueNotifier: upcomingNotifier,
                          ),
                          verticalSpace(ScreenSize.screenHeight / 40),
                          MainTitleCard(
                            title: 'Top Rated',
                            valueNotifier: topRatedNotifier,
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
