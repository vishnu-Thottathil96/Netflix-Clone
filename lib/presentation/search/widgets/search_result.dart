import 'package:flutter/material.dart';
import 'package:netflix/core/constant/baseurl.dart';
import 'package:netflix/core/constant/listenables.dart';
import 'package:netflix/models/model_movie.dart';
import 'package:netflix/presentation/search/widgets/title.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        verticalSpace(ScreenSize.screenHeight / 50),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: searchNotifier,
              builder: (context, value, _) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: 1.02 / 1.4,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return MainCard(
                      movie: value[index],
                    );
                  },
                  itemCount: value.length,
                );
              }),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(baseUrl + movie.posterPath),
        ),
      ),
    );
  }
}
