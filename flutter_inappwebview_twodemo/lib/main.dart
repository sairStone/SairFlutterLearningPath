import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview_twodemo/common/i18n/strings.g.dart';
import 'package:flutter_inappwebview_twodemo/common/theme/dark_theme.dart';
import 'package:flutter_inappwebview_twodemo/common/theme/light_theme.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/applet/pages/applet_assets_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/applet/pages/applet_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/applet/pages/applet_service_page.dart';
import 'package:flutter_inappwebview_twodemo/splash.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale(); // 依赖于slang库（i18n），根据设备的系统设置自动选择合适的语言环境

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InappWebView Demo',
      debugShowCheckedModeBanner: false,
      // 下面三行代码 确保主题能够根据系统设置 明 暗
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home:  FrameWidget(),
      routes: {
        '/applet': (context) => const AppletPage(),
        '/applet/index': (context) => const AppletAssetsPage(),
        '/applet/server': (context) => const AppletServicePage(),
      },
    );
  }
}

class FrameWidget extends StatefulWidget {
  const FrameWidget({super.key});

  @override
  State<FrameWidget> createState() => _FrameWidgetState();
}

class _FrameWidgetState extends State<FrameWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPage()
    );
  }
}
