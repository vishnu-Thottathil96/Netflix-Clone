import 'package:flutter/material.dart';
import 'package:netflix/models/model_movie.dart';

import '../../core/constant/baseurl.dart';
import '../../core/constant/screen_size.dart';

// List homePageCardImages = [
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vB8o2p4ETnrfiWEgVxHmHWP9yRl.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kdPMUMJzyYAc4roD52qavX0nLIC.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5ScPNT6fHtfYJeWBajZciPV3hEL.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vB8o2p4ETnrfiWEgVxHmHWP9yRl.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg',
//   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
// ];

class HomeMainCard extends StatelessWidget {
  const HomeMainCard(
      {super.key, required this.index, required this.movieModel});
  final int index;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: ScreenSize.screenHeight / 4,
        width: ScreenSize.screenWidth / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(baseUrl + movieModel.posterPath),
          ),
        ),
      ),
    );
  }
}
