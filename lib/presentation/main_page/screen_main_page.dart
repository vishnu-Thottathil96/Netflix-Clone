import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/screen_download.dart';
import 'package:netflix/presentation/fast_laugh/screen_fastlaugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/news_hot/news_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});
  final List pages = const [
    ScreenHome(),
    ScreenNewsHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
