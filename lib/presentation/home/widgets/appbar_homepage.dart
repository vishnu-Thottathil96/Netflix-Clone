import 'package:flutter/material.dart';

import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../../../core/constant/text_theme.dart';

class CostomisedDisapearingAppBar extends StatelessWidget {
  const CostomisedDisapearingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 3000),
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      height: ScreenSize.screenHeight / 11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: const AssetImage('assets/lmages/N.png'),
                height: ScreenSize.screenHeight / 16,
                width: ScreenSize.screenHeight / 16,
              ),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('TV Shows', style: homeTitleText),
              Text('Movies', style: homeTitleText),
              Text('Categories', style: homeTitleText),
            ],
          ),
        ],
      ),
    );
  }
}
