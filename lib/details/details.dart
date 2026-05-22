import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details", 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight(600)
          ),
        ),
        backgroundColor: Colors.blue,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
        actions: [

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Details Page!!!'),
          ],
        ),
      ),
    );
  }
}