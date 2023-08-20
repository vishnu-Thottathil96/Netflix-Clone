import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/debouncer/debouncer.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/screen_size.dart';
import 'package:netflix/core/constant/space.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';
import 'package:netflix/view/search/widgets/search_result.dart';

import '../../controller/api/api.dart';
import '../../core/constant/listenables.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> showSearchResult = ValueNotifier<bool>(false);
    TextEditingController searchController = TextEditingController();
    getSearchList() async {
      final debouncer = Debouncer(delay: const Duration(milliseconds: 1000));
      debouncer.call(() async {
        return searchNotifier.value =
            await Api().getSearchApi(searchKeyWord: searchController.text);
      });
    }

    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        showSearchResult.value = true;
        getSearchList();
      } else {
        showSearchResult.value = false;
      }
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(ScreenSize.screenWidth / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.screenHeight / 17,
              child: CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                controller: searchController,
              ),
            ),
            verticalSpace(ScreenSize.screenHeight / 50),
            Expanded(
                child: ValueListenableBuilder<bool>(
              valueListenable: showSearchResult,
              builder: (context, value, child) {
                return value ? const SearchResult() : const SearchIdle();
              },
            )),
          ],
        ),
      )),
    );
  }
}
