import 'package:flutter/material.dart';
import 'package:flutter_app_worldtime/pages/choose_location.dart';
import 'package:flutter_app_worldtime/pages/home.dart';
import 'package:flutter_app_worldtime/pages/loading.dart';

void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    /// 可以切换路由时，不能返回const的对象
    /// 设置路由
    return MaterialApp(
      title: 'Sair WorldTime App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    );
  }
}