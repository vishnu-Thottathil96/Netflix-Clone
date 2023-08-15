import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../../home/widgets/custom_icon.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenSize.screenWidth / 7,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: greyColor),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: ScreenSize.screenWidth - ScreenSize.screenWidth / 7,
          height: ScreenSize.screenHeight / 1.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              verticalSpace(10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'West World',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const CustomButtonWidget(
                        iconSize: 20,
                        textSize: 10,
                        icon: Icons.alarm_add,
                        title: 'Remind Me',
                      ),
                      horizontalSpace(ScreenSize.screenWidth / 20),
                      const CustomButtonWidget(
                        iconSize: 20,
                        textSize: 10,
                        icon: Icons.info,
                        title: 'Info',
                      ),
                      horizontalSpace(10),
                    ],
                  ),
                ],
              ),
              verticalSpace(10),
              const Text('Coming on Friday'),
              verticalSpace(20),
              const Text(
                'West World',
                style: TextStyle(fontSize: 25),
              ),
              verticalSpace(10),
              const Text(
                'The story begins in Westworld, a fictional, technologically advanced Wild-West-themed amusement park populated by android "hosts". The park caters to high-paying guests who may indulge their wildest fantasies within the park without fear of retaliation from the hosts.',
                style: TextStyle(color: greyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
