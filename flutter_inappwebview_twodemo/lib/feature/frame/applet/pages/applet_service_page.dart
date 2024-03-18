import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/front/pages/front_page.dart';
import 'package:logger/logger.dart';

// 本地服务具体路径执行
class AppletServicePage extends StatefulWidget {
  const AppletServicePage({Key? key}) : super(key: key);

  @override
  State<AppletServicePage> createState() => _MyAppState();
}

class _MyAppState extends State<AppletServicePage> {
  late InAppLocalhostServer localhostServer;
  bool serverStarted = false;

  @override
  void initState() {
    super.initState();

    logger.i("onLoadInit: init");

    localhostServer = InAppLocalhostServer(documentRoot: 'assets/dist/');
    startLocalHostServer();
  }

  Future<void> startLocalHostServer() async {
    try {
      await localhostServer.start();
      setState(() {
        serverStarted = true;
      });
    } catch (e) {
      logger.e("Failed to start localhost server: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppLocalhostServer Example'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: !serverStarted
                  ? Center(child: CircularProgressIndicator())
                  : InAppWebView(
                      initialSettings: InAppWebViewSettings(
                        isInspectable: kDebugMode,
                      ),
                      initialUrlRequest:
                          URLRequest(url: WebUri("https://localhost:8083/index.html")),
                      onWebViewCreated: (controller) {},
                      onLoadStart: (controller, url) {
                        logger.i("onLoadStart: $url");
                      },
                      onLoadStop: (controller, url) {
                        // 页面加载完成
                      },
                      onLoadError: (controller, url, code, message) {
                        // 页面加载错误
                        logger.e("Error loading $url: $message");
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
