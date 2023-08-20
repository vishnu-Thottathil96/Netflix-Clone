import 'package:flutter/material.dart';
import 'package:netflix/core/constant/baseurl.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.image,
    required this.margin,
    this.angle = 0,
    required this.height,
    required this.width,
  });

  final String image;
  final double angle;

  final double height;
  final double width;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(baseUrl + image),
          ),
        ),
      ),
    );
  }
}
