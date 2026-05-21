import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Details Page!!!'),
            const SizedBox(height: 20,),
            BackButton(
              onPressed: () {
                //context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Click back button."),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: "Rollback", 
                      textColor: Colors.white,
                      onPressed: () {
                        context.pop();
                      }
                    ),
                  )
                );
              
              },
            ),
          
            ElevatedButton(
              onPressed: () {

              }, 
              child: const Text("Hello..."),

            )
          ],
        ),
      ),
    );
  }
}