import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/theme/dark_theme.dart';
import 'package:flutter_app_whatsapp/common/theme/light_theme.dart';
import 'package:flutter_app_whatsapp/feature/navigation/app_navigation.dart';

void main() {
  // If you're running an application and need to access the binary messenger
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whats app',
      debugShowCheckedModeBanner: false,
      // 下面三行代码 确保主题能够根据系统设置 明 暗
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const AppNavigation(),
    );
  }
}
