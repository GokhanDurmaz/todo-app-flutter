import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/widgets/details.dart';
import 'package:todo_app_flutter/main.dart';
import 'package:todo_app_flutter/widgets/profile.dart';
import 'package:todo_app_flutter/widgets/bottom/bottom_navigator.dart';
import 'package:todo_app_flutter/widgets/top/appbar.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: const CustomAppBar(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const BottomNavigator(),
              ),
            )
          ),
          body: SafeArea(
            bottom: false,
            child: child
          ),
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
              builder: (context, state) => const DetailScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ]
        )
      ]
    )
  ]
);