import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/details/details.dart';
import 'package:todo_app_flutter/main.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder:(context, state) {
        return const MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/details',
          builder: (context, state) {
            return const DetailScreen();
          },
        )
      ]
    )
  ]
);