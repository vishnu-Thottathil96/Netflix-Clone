import 'package:flutter/material.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_actionwidget.dart';
import 'package:netflix/presentation/fast_laugh/widgets/volume_button.dart';

List pageViewimages = [
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/20f2GThu22hp5MgCA4dg3bZ3gTS.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/zrwNvkdYXrgFea41AxhJhIKopov.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/A4YcCSEplajvidu3PuzvwpGFBWb.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vqslbmy5xvnNf5uGcvwWAqq4us4.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aKDgEKLZ41S54y4UdPJB6RKZ7lM.jpg',
];

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

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
                pageViewimages[index],
              ),
            ),
          ),
          //color: Colors.accents[index % Colors.accents.length],
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
                      backgroundImage: NetworkImage(pageViewimages[index]),
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
