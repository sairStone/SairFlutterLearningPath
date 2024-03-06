import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/models/playlist_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_muscidemo/pages/home_page.dart';
import 'package:flutter_app_muscidemo/themes/theme_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlaylistProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      // 通过 provider包 管理的theme配置，但需要先对 顶层runApp进行注册
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
