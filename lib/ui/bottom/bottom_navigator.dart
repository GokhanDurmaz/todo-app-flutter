import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  
  @override
  State<StatefulWidget> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  
  int _getSelectedPageIndex(BuildContext ctx) {
    final String? location = ModalRoute.of(context)?.settings.name;
    if(location == '/details') {
      return 1;
    } else if(location == '/profile') {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _getSelectedPageIndex(context),
        onTap: (index) {
          if(index == 0) {
            context.go('/');
          } else if(index == 1) {
            context.go('details');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Details"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
      );
  }
}