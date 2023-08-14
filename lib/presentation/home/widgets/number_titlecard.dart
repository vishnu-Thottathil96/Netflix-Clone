import 'package:flutter/material.dart';

import '../../../core/constant/screen_size.dart';
import '../../../core/constant/space.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
