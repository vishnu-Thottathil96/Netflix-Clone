import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/view/fast_laugh/widgets/video_list_item.dart';

import '../../core/constant/listenables.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: nowPlayingNotifier,
            builder: (context, value, _) {
              return PageView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  popularNotifier.value.length,
                  (index) {
                    return VideoListItem(
                      movie: value[index],
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
