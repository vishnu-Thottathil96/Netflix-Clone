import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/section2_downloads.dart';
import 'package:netflix/presentation/downloads/widgets/section3_downloads.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import '../../core/constant/space.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});
  final _widgetList = const [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => verticalSpace(30),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: whiteColor,
        ),
        horizontalSpace(10),
        const Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
