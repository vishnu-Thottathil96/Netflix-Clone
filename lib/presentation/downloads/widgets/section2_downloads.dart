import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../screen_download.dart';
import 'downloads_image_widget.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final List imageList = [
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/zSqJ1qFq8NXFfi7JeIYMlzyR0dx.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
    ];

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
                image: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 45),
                angle: 22 * pi / 180,
                height: ScreenSize.screenWidth / 1.8,
                width: ScreenSize.screenWidth / 2.7,
              ),
              DownloadsImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(right: 130, bottom: 45),
                angle: -22 * pi / 180,
                height: ScreenSize.screenWidth / 1.8,
                width: ScreenSize.screenWidth / 2.7,
              ),
              DownloadsImageWidget(
                image: imageList[2],
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
