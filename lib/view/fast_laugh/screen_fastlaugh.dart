import 'package:flutter/material.dart';
import 'package:netflix/controller/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/view/fast_laugh/widgets/video_list_item.dart';

import '../../core/constant/listenables.dart';

class ScreenFastLaughs extends StatefulWidget {
  const ScreenFastLaughs({super.key});

  @override
  State<ScreenFastLaughs> createState() => _ScreenFastLaughsState();
}

class _ScreenFastLaughsState extends State<ScreenFastLaughs> {
  late Future<List<String>> videoUrlFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoUrlFuture = Api().getFastLaughVideoUrls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: FutureBuilder(
            future: videoUrlFuture,
            builder: (context, value) {
              if (value.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (value.hasData) {
                return PageView.builder(
                  itemCount: value.data!.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return VideoListItem(
                      image: popularNotifier.value[index].backDropPath,
                      videoUrl: value.data![index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
