import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../core/constant/screen_size.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/8rpDcsfLJypbO6vREc0547VKqEv.jpg';

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
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItemTile(),
            separatorBuilder: (context, index) =>
                verticalSpace(ScreenSize.screenHeight / 50),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: ScreenSize.screenWidth / 2.4,
          height: ScreenSize.screenHeight / 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            '   Movie Name',
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: whiteColor,
          size: 45,
        )
        // const CircleAvatar(
        //     backgroundColor: whiteColor,
        //     radius: 22,
        //     child: CircleAvatar(
        //       radius: 20,
        //       backgroundColor: blackColor,
        //       child: Icon(
        //         CupertinoIcons.play,
        //         color: whiteColor,
        //       ),
        //     ))
      ],
    );
  }
}
