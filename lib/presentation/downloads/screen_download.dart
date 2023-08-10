import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

import '../../core/constant/screen_size.dart';
import '../../core/constant/space.dart';
import '../splash/screen_splash.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});
  final _widgetList = const [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => verticalSpace(30),
      ),
    );
  }
}

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

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: blueButton,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        verticalSpace(10),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          onPressed: () {},
          color: whiteColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'What you can download',
              style: TextStyle(
                  color: blackColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: whiteColor,
        ),
        horizontalSpace(10),
        const Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.image,
    required this.margin,
    this.angle = 0,
    required this.height,
    required this.width,
  });

  final String image;
  final double angle;

  final double height;
  final double width;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
