import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'wabiz',
      routerConfig: router,
      theme: wabizDefaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: Duration(microseconds: 350),
      ),
    );
  }
}
