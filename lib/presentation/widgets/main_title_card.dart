import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../core/constant/screen_size.dart';
import '../../core/constant/space.dart';

import '../../models/model_movie.dart';
import 'main_card.dart';
import 'main_title.dart';

ValueNotifier<List<MovieModel>> nowPlayingNotifier = ValueNotifier([]);

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title});
  final String title;
  getNowPlayingList() async {
    nowPlayingNotifier.value = await Api().getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    getNowPlayingList();
    return ValueListenableBuilder(
        valueListenable: nowPlayingNotifier,
        builder: (context, value, _) {
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
                    nowPlayingNotifier.value.length,
                    (index) => HomeMainCard(
                      index: index,
                      movieModel: value[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
