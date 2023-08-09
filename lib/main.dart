import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

import 'core/constant/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        textTheme: textTheme,
      ),
      home: const ScreenMainPage(),
    );
  }
}
