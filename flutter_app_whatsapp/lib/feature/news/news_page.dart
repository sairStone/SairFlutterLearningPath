import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/common/extension/custom_theme_extension.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // 全局 key,用于全局访问，可以深入到InappWebView组件
  final GlobalKey webViewKey = GlobalKey();

  // 控制器
  InAppWebViewController? webViewController;

  Future<void> setIsPhone() async {
    // 判断是不是android平台，此外还支持使用调试模式，可以使用谷歌 devtool工具调试web页面
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
    }
  }

  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      // 启用cookies支持，当然，大多数组件默认支持的，但还是开启一下比较好
      javaScriptCanOpenWindowsAutomatically: true,
      allowFileAccess: true,
      // allowCookies: true, 这个报错

      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  // 监听和控制下拉刷新
  PullToRefreshController? pullToRefreshController;

  String url = ''; // 具体展示的页面
  double progress = 0; // 页面加载的百分比

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 判断是不是手机端
    setIsPhone();

    // 根据KIsWeb判断是不是Web端，不是Web端就可以让下拉刷新的控制器有实现具体实例
    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              // defaultTargetPlatform是foundation包里的常量，用来判断具体设备
              if (defaultTargetPlatform == TargetPlatform.android) {
                // 重新加载页面，不同设备使用控制器调用不同的方法
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            '师大新闻',
            style: TextStyle(
                color: context.color.authAppbarTextColor, fontSize: 20),
          ),
          // centerTitle: ,
          actions: [
            IconButton(
              onPressed: () {
                print('this is shared button!');
              },
              splashColor: Colors.transparent,
              splashRadius: 22,
              iconSize: 22,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40),
              icon: const Icon(Icons.more_vert),
              color: context.color.greyColor,
            )
          ],
        ),
        body: SafeArea(
            //  Expanded布局需要放到类似Column和Row这类的Flex容器里面，Expanded需要应用在弹性布局里面
            child: Column(children: [
          Expanded(
            child: Stack(children: [
              InAppWebView(
                key: webViewKey, // 在Widget外部引用这个InAppWebView组件，用来加载新页面
                // 初始的url链接
                initialUrlRequest:
                    URLRequest(url: WebUri("https://baidu.com/")),

                // 初始化的webview配置
                initialSettings: settings,

                // 下拉刷新的控制器
                pullToRefreshController: pullToRefreshController,

                // 回调函数，在 WebView 创建完成后被调用
                // 当 WebView 创建完成后，将传递进来的 controller 对象赋值给外部定义的变量 webViewController。
                // 这样做的目的是为了在后续的代码中可以通过 webViewController 来操控和响应 WebView 的各种行为和事件。
                // 例如，如果你想加载一个新的 URL，可以调用 webViewController.loadUrl('https://www.example.com')。
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },

                // 监听 WebView 加载新 URL ,然后就用setState重让 Widget 树重建，从而更新页面
                onLoadStart: (controller, url) {
                  setState(() {
                    // this.url 保存当前 WebView 正在加载的 URL 地址。
                    this.url = url.toString();
                  });
                },
                // flutter_inappwebview的一个函数，该函数会在 WebView 中的页面尝试请求某些权限（如地理位置、摄像头、麦克风等）时触发。
                // request: 包含了关于所请求权限详细信息的对象，例如请求资源类型（如地理位置、相机、麦克风等）
                onPermissionRequest: (controller, request) async {
                  // 返回的PermissionResponse对象包含了请求的资源类型（resources）以及对请求的处理方式（action）。
                  // 直接授予（GRANT）了请求的所有资源权限，即无论请求何种资源，都同意授权给 WebView 页面使用。
                  return PermissionResponse(
                      resources: request.resources,
                      action: PermissionResponseAction.GRANT);
                },

                //该函数在 WebView 需要加载新 URL 时被调用，允许开发者决定是否允许 WebView 自行加载这个 URL，还是采取其他操作，例如跳转到系统的默认浏览器或其他应用进行加载。
                // navigationAction: 包含了有关即将加载的新 URL 的信息，其中 request.url 即是要加载的 Uri。
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  /* 下面代码 ：检查该 Uri 的 scheme 是否在预设的安全协议列表中（如 'http', 'https', 'file', 'chrome', 'data', 'javascript', 'about'）。如果不是，则执行以下操作：
                使用 canLaunchUrl 函数检查系统是否能够打开这个 Uri。如果可以：
                使用 launchUrl 函数将 Uri 发送给系统，让系统默认的浏览器或其他应用处理这个链接。
                返回 NavigationActionPolicy.CANCEL，告诉 WebView 不要继续加载这个 URL，因为已经交由系统处理。

                如果不在预设安全协议列表中但系统无法处理这个 Uri，则默认允许 WebView 加载这个 URL。
                最后，如果 Uri 的 scheme 在预设的安全协议列表中，函数会返回 NavigationActionPolicy.ALLOW，允许 WebView 自行加载该 URL。*/
                  if (![
                    "http",
                    "https",
                    "file",
                    "chrome",
                    "data",
                    "javascript",
                    "about"
                  ].contains(uri.scheme)) {
                    if (await canLaunchUrl(uri)) {
                      // Launch the App,用来将uri发送给设别的浏览器
                      await launchUrl(
                        uri,
                      );
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
                },

                // 这个回调函数会在 WebView 完成加载网页内容并停止加载时触发。
                onLoadStop: (controller, url) async {
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                  });
                },

                // 这个回调函数在接收错误时触发
                onReceivedError: (controller, request, error) {
                  pullToRefreshController?.endRefreshing();
                },

                // 这个方法会在 WebView 加载页面的过程中持续触发，每次触发都会携带当前页面加载进度的百分比值。
                /* 使用 setState 方法更新应用程序的状态，在这里：
                        将实际的加载进度转换为 0 至 1 之间的浮点数，即 progress / 100，然后将其赋值给 this.progress，、
                        这可能用于显示一个进度条或者其它UI元素来反映加载进度。*/
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                  });
                },

                // 加载历史记录
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  setState(() {
                    this.url = url.toString();
                  });
                },

                // 当 WebView 中的 JavaScript 执行产生 console.log() 或类似日志输出时，onConsoleMessage 回调会被触发。
                // 在这个回调函数中，如果处于 debug 模式（kDebugMode 为 true），则会将 consoleMessage 输出到 Dart 控制台，方便开发者查看 JavaScript 侧的日志信息
                onConsoleMessage: (controller, consoleMessage) {
                  if (kDebugMode) {
                    print(consoleMessage);
                  }
                },
              ),
            ]),
          ),
        ])));
  }
}