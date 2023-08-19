import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/models/model_movie.dart';
import 'package:netflix/presentation/search/widgets/title.dart';
import '../../../core/constant/baseurl.dart';
import '../../../core/constant/listenables.dart';
import '../../../core/constant/screen_size.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        verticalSpace(ScreenSize.screenHeight / 50),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: topRatedNotifier,
              builder: (context, value, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TopSearchItemTile(
                      movieModel: value[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      verticalSpace(ScreenSize.screenHeight / 50),
                  itemCount: topRatedNotifier.value.length,
                );
              }),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: ScreenSize.screenWidth / 2.4,
          height: ScreenSize.screenHeight / 10,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(baseUrl + movieModel.backDropPath),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              movieModel.originalTitle,
              style: const TextStyle(
                  color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: whiteColor,
          size: 45,
        )
      ],
    );
  }
}
