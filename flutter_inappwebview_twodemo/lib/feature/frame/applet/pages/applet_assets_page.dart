import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class AppletAssetsPage extends StatefulWidget {
  const AppletAssetsPage({super.key});

  @override
  State<AppletAssetsPage> createState() => _MyAppState();
}

class _MyAppState extends State<AppletAssetsPage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,

      // Setting this off for security. Off by default for SDK versions >= 16.
      allowFileAccessFromFileURLs: false,
      // Off by default, deprecated for SDK versions >= 30.
      allowUniversalAccessFromFileURLs: false,

      // Keeping these off is less critical but still a good idea, especially if your app is not
      // using file:// or content:// URLs.
      allowFileAccess: false,
      allowContentAccess: false,

      // Basic WebViewAssetLoader with custom domain0
      webViewAssetLoader: WebViewAssetLoader(
          domain: "my.custom.domain.com",
          pathHandlers: [AssetsPathHandler(path: '/assets/')]));

// 由于是build后的本地资源，所以热加载刷新没有用，需要用fluttter clean 清除原有包之后，再运行才可以

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WebView Asset Loader'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(
                url: WebUri(
                  // 开发时的assets就在实际打包后的apk/flutter_assets目录下
                    "https://my.custom.domain.com/assets/flutter_assets/assets/website/index.html")),
            initialSettings: settings,
          )),
        ]));
  }
}