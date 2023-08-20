import 'package:flutter/material.dart';
import 'package:netflix/core/constant/baseurl.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/models/model_movie.dart';
import 'package:netflix/view/fast_laugh/widgets/video_actionwidget.dart';
import 'package:netflix/view/fast_laugh/widgets/volume_button.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final String image;
  final String videoUrl;
  const VideoListItem({
    super.key,
    required this.image,
    required this.videoUrl,
  });

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Center(
                child: CircularProgressIndicator(),
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
                      backgroundImage: NetworkImage(baseUrl + widget.image),
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
