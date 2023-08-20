import 'package:flutter/material.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(
          ScreenSize.screenHeight / 100,
        ),
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
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
    );
  }
}
