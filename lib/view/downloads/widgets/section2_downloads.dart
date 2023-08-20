import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/constant/listenables.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import 'downloads_image_widget.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        verticalSpace(10),
        const Text(
          'We\'ll download a personalised selection of movies and shows for you,so there\'s\nalways something to wathch on your\ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          height: ScreenSize.screenWidth / 1.2,
          width: ScreenSize.screenWidth / 1.2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 99, 98, 98),
                radius: ScreenSize.screenWidth / 2.6,
              ),
              DownloadsImageWidget(
                image: popularNotifier.value[8].posterPath,
                margin: const EdgeInsets.only(left: 130, bottom: 45),
                angle: 22 * pi / 180,
                height: ScreenSize.screenWidth / 1.8,
                width: ScreenSize.screenWidth / 2.7,
              ),
              DownloadsImageWidget(
                image: popularNotifier.value[5].posterPath,
                margin: const EdgeInsets.only(right: 130, bottom: 45),
                angle: -22 * pi / 180,
                height: ScreenSize.screenWidth / 1.8,
                width: ScreenSize.screenWidth / 2.7,
              ),
              DownloadsImageWidget(
                image: popularNotifier.value[4].posterPath,
                margin: const EdgeInsets.all(0),
                height: ScreenSize.screenWidth / 1.59,
                width: ScreenSize.screenWidth / 2.4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
