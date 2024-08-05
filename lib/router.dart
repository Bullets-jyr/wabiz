import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz/views/favorite/favorite_page.dart';
import 'package:wabiz/views/home/home_page.dart';
import 'package:wabiz/views/wabiz_app_shell.dart';

import 'views/category/category_page.dart';
import 'views/login/sign_in_page.dart';
import 'views/login/sign_up_page.dart';
import 'views/my/my_page.dart';
import 'views/project/add_project_page.dart';
import 'views/project/add_reward_page.dart';
import 'views/project/project_detail_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    // 로그인
    GoRoute(
      path: '/login',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignInPage(),
    ),
    // 회원가입
    GoRoute(
      path: '/sign-up',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return WabizAppShell(
          // currentIndex: 0,
          currentIndex: switch (state.uri.path) {
            var p when p.startsWith('/favorite') => 2,
            var p when p.startsWith('/my') => 3,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomePage(),
          routes: [
            // 홈에서 ~로 이동
            // nested된 router 앞에는 /를 붙이지 않습니다.
            GoRoute(
              path: 'category/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                print(id);
                return CategoryPage(
                  categoryId: id,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorite',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            return const FavoritePage();
          },
        ),
        GoRoute(
          path: '/my',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            return const MyPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/add',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const AddProjectPage();
      },
      routes: [
        GoRoute(
          path: 'reward/:id',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final projectId = state.pathParameters['id']!;
            return AddRewardPage(
              projectId: projectId,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final project = state.extra as String;
        return ProjectDetailPage(
          project: project,
        );
      },
    ),
  ],
);
