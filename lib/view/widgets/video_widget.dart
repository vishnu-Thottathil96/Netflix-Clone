import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constant/baseurl.dart';
import '../fast_laugh/widgets/volume_button.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: 300,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(baseUrl + imageUrl),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: VolumeButton(
            color: whiteColor,
          ),
        ),
      ],
    );
  }
}
