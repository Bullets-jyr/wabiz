import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabiz/data/data_source/local/shared_pref_provider.dart';

import 'router.dart';
import 'theme.dart';
import 'presentation/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FutureProvider, AsyncNotifierProvider
  // Async
  // SharedPreferences
  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // 값을 override해서 초기화 시킵니다.
        sharedPreferencesProvider.overrideWithValue(pref),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'wabiz',
      routerConfig: router,
      // 테마 적용
      // main
      theme: wabizDefaultTheme,
      // dark
      darkTheme: ThemeData.dark(),
      // using provider
      // ThemeMode.light == theme: wabizDefaultTheme
      themeMode: ThemeMode.light,
      // theme 변경될 때, 적용할 애니메이션 효과
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: Duration(microseconds: 350),
      ),
    );
  }
}
