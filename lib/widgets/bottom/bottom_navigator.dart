import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  
  @override
  State<StatefulWidget> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  
  int _getSelectedPageIndex(BuildContext ctx) {
    final String location = GoRouterState.of(context).uri.path;

    if(location == '/details') {
      return 1;
    } else if(location == '/profile') {
      return 2;
    }

    return 0;
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required int currentIndex,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor = isSelected ? Colors.white : Colors.white70;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if(index == 0) {
            context.go('/');
          } else if(index == 1) {
            context.go('/details');
          } else if(index == 2) {
            context.go('/profile');
          }
        },
        child: Container(
          color: Colors.transparent, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon, 
                color: itemColor, 
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: itemColor,
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _getSelectedPageIndex(context);

    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(index: 0, icon: Icons.home, label: "Home", currentIndex: currentIndex),
          _buildNavItem(index: 1, icon: Icons.list, label: "Details", currentIndex: currentIndex),
          _buildNavItem(index: 2, icon: Icons.person, label: "Profile", currentIndex: currentIndex),
        ],
      ),
    );
  }
}