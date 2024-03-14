import 'package:flutter/material.dart';

class AppcenterPage extends StatelessWidget {
  const AppcenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('应用中心'),
      ),
      body: const SafeArea(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('this is AppcenterPage')
          ],
        )
      ),
    );
  }
}