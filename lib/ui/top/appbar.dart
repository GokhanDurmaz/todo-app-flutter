import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _CustomAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: BackButton(
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
      actions: [
        IconButton(
          onPressed: () {
            
          }, 
          icon: const Icon(Icons.notifications, color: Colors.white,),
        )
      ],
    );
  }
}