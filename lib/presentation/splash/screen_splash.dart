import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import '../main_page/screen_main_page.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.screenHeight = MediaQuery.of(context).size.height;
    ScreenSize.screenWidth = MediaQuery.of(context).size.width;

    splashNavigate(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
            verticalSpace(ScreenSize.screenHeight / 50),
            const Text('Loading'),
          ],
        ),
      ),
    );
  }

  void splashNavigate(context) async {
    await Future.delayed(const Duration(seconds: 0));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMainPage(),
        ));
  }
}
