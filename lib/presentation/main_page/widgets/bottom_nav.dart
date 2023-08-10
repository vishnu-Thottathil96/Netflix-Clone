import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              currentIndex: newIndex,
              onTap: (value) {
                indexChangeNotifier.value = value;
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color.fromARGB(255, 97, 96, 96),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions_outlined),
                    label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download_for_offline), label: 'Downloads')
              ]),
        );
      },
    );
  }
}
