import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List.generate(
              5,
              (index) {
                return VideoListItem(
                  index: index,
                );
              },
            )),
      ),
    );
  }
}
