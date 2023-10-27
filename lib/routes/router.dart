import 'package:flutter/material.dart';
import 'package:flutter_template/modules/auth/screen_login.dart';
import 'package:flutter_template/modules/home/screen_home.dart';
import 'package:flutter_template/modules/root.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

class CommonRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: routeRoot,
        builder: (BuildContext context, GoRouterState state) {
          return const ScreenRoot();
        },
        routes: <RouteBase>[
          GoRoute(
            path: routeLogin,
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenLogin();
            },
          ),
          GoRoute(
            path: routeHome,
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenHome();
            },
          ),
        ],
      ),
    ],
  );
}
