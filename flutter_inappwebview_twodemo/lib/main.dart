import 'package:flutter/material.dart';
import 'package:flutter_inappwebview_twodemo/common/theme/dark_theme.dart';
import 'package:flutter_inappwebview_twodemo/common/theme/light_theme.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/counter/pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InappWebView Demo',
      debugShowCheckedModeBanner: false,
      // 下面三行代码 确保主题能够根据系统设置 明 暗
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: CounterPage(),
    );
  }
}
