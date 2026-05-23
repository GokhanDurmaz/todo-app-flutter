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

  // Her bir menü elemanını dikeyde ortalayarak oluşturan yardımcı fonksiyon
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
          // Tıklama alanının tüm dikey sütunu kapsaması için şeffaf arka plan
          color: Colors.transparent, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // DİKEYDE KESİN ORTALAMA
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon, 
                color: itemColor, 
                size: 24,
              ),
              const SizedBox(height: 4), // İkon ve yazı arasındaki dengeli boşluk
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
      height: 64, // İstediğin ideal ince bar yüksekliği (Artık asla taşma yapmaz)
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