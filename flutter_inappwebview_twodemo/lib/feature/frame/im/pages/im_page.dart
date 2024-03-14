import 'package:flutter/material.dart';

class IMPage extends StatelessWidget {
  const IMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('腾讯云通讯IM'),
      ),
      body: const SafeArea(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('this is IMPage')
          ],
        )
      ),
    );
  }
}