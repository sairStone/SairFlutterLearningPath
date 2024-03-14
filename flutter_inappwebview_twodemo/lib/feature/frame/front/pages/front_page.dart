import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png'),radius: 50,),
        ),
        title: Text('前台页面'),
      ),
      body: const SafeArea(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('this is FrontPage')
          ],
        )
      ),
    );
  }
}