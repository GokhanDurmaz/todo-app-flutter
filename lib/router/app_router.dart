import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/details/details.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/ui/bottom/bottom_navigator.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          bottomNavigationBar: const BottomNavigator(),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder:(context, state) {
            return const MainScreen();
          },
          routes: [
            GoRoute(
              path: '/details',
              builder: (context, state) {
                return const DetailScreen();
              },
            )
          ]
        )
      ]
    )
  ]
);