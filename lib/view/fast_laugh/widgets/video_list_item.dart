import 'package:flutter/material.dart';
import 'package:netflix/core/constant/baseurl.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/models/model_movie.dart';
import 'package:netflix/view/fast_laugh/widgets/video_actionwidget.dart';
import 'package:netflix/view/fast_laugh/widgets/volume_button.dart';

class VideoListItem extends StatelessWidget {
  final MovieModel movie;
  const VideoListItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                baseUrl + movie.posterPath,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenHeight / 80,
              vertical: ScreenSize.screenHeight / 80,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 29,
                  child: VolumeButton(),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(baseUrl + movie.posterPath),
                      radius: 30,
                    ),
                    verticalSpace(10),
                    const VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'Lol'),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    const VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    const VideoActionsWidget(
                        icon: Icons.play_arrow, title: 'play'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
