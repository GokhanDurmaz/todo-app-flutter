import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/widgets/bottom/bottom_navigator.dart';

void main() {

  group('All navigation tests', () {

    final mockRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            bottomNavigationBar: BottomNavigator(),
          ),
        ),
        GoRoute(path: '/details', builder: (context, state) => const SizedBox(),),
        GoRoute(path: '/profile', builder: (context, state) => const SizedBox(),)
      ]
    );
    testWidgets('Navigation Controller', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: mockRouter,
        )
      );
    
      // Verify that our counter starts at 0.
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Details'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('When clicking nav items, the pages are switched', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: mockRouter,
        )
      );

      final searchBtn = find.text('Details');
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();
    
      final profileBtn = find.text('Profile');
      await tester.tap(profileBtn);
      await tester.pumpAndSettle();
    });
  });

}
