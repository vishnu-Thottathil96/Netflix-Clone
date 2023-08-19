import 'package:flutter/material.dart';
import 'package:netflix/core/constant/baseurl.dart';
import 'package:netflix/models/model_movie.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/space.dart';
import '../../home/widgets/custom_icon.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Text(
          movie.originalTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        verticalSpace(10),
        Text(
          movie.overView,
          style: TextStyle(color: greyColor),
        ),
        verticalSpace(10),
        VideoWidget(
          imageUrl: baseUrl + movie.backDropPath,
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
