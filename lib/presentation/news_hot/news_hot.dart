import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/news_hot/widgets/appbar_with_tabs.dart';
import 'package:netflix/presentation/news_hot/widgets/coming_soon.dart';
import 'package:netflix/presentation/news_hot/widgets/widget_everyonewatching.dart';

class ScreenNewsHot extends StatelessWidget {
  const ScreenNewsHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBarNewandHot(),
        ),
        backgroundColor: backgroundColor,
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryoneWatching(),
        ]),
      ),
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const EveryoneWatching();
      },
      itemCount: 10,
    );
  }

  Widget _buildComingSoon() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ComingSoonWidget();
        },
        itemCount: 10,
      ),
    );
  }
}
