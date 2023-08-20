import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/models/model_movie.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../../home/widgets/custom_icon.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  final DateFormat monthFormater = DateFormat('MMM');
  final DateFormat dayNumberFormater = DateFormat('dd');
  final DateFormat dayFormater = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenSize.screenWidth / 7,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthFormater
                    .format(DateTime.parse(movie.releaseDate))
                    .toUpperCase(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: greyColor),
              ),
              Text(
                dayNumberFormater.format(DateTime.parse(movie.releaseDate)),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: ScreenSize.screenWidth - ScreenSize.screenWidth / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                imageUrl: movie.backDropPath,
              ),
              verticalSpace(10),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      movie.originalTitle,
                      style: const TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -4),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const CustomButtonWidget(
                        iconSize: 20,
                        textSize: 10,
                        icon: Icons.notifications,
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
              Text(
                  'Coming on ${dayFormater.format(DateTime.parse(movie.releaseDate))}'),
              verticalSpace(20),
              Text(
                movie.originalTitle,
                style: const TextStyle(fontSize: 21),
              ),
              verticalSpace(10),
              Text(
                movie.overView,
                style: const TextStyle(color: greyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
