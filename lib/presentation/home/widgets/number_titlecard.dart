import 'package:flutter/material.dart';
import 'package:netflix/models/model_movie.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

ValueNotifier<List<MovieModel>> topTenNotifier = ValueNotifier([]);

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: ('Top 10 TV Shows In India Today'),
        ),
        verticalSpace(ScreenSize.screenHeight / 100),
        LimitedBox(
          maxHeight: ScreenSize.screenHeight / 4,
          child: ValueListenableBuilder(
              valueListenable: topTenNotifier,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length < 10 ? value.length : 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NumberCard(
                      index: index,
                      movieModel: value[index],
                    );
                  },
                  // children: List.generate(
                  //   10,
                  //   (i) =>
                  //    NumberCard(
                  //     index: i,
                  //     movieModel: value[],
                  //   ),
                  // ),
                );
              }),
        ),
      ],
    );
  }
}
