import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constant/screen_size.dart';
import '../screen_home.dart';
import 'custom_icon.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: ScreenSize.screenHeight / 1.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(homeMainImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(whiteColor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: blackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Text(
          'Play',
          style: TextStyle(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
