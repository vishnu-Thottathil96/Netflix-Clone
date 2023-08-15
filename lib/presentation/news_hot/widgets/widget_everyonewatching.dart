import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/space.dart';
import '../../home/widgets/custom_icon.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        const Text(
          'Sherlock',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        verticalSpace(10),
        const Text(
          'The fourth series begins with the nation’s favourite detective, the mercurial Sherlock Holmes, back once more on British soil.',
          style: TextStyle(color: greyColor),
        ),
        verticalSpace(10),
        const VideoWidget(
          imageUrl:
              'https://www.themoviedb.org/t/p/original/4q6TBkY0Ilx7WtV5LX8HRqNHr5J.jpg',
        ),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 13,
            ),
            horizontalSpace(15),
            const CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 13,
            ),
            horizontalSpace(15),
            const CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 13,
            ),
            horizontalSpace(15),
          ],
        )
      ],
    );
  }
}
