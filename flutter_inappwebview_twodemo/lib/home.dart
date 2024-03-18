import 'package:flutter/material.dart';
import 'package:flutter_inappwebview_twodemo/common/fonts/app_icons.dart';
import 'package:flutter_inappwebview_twodemo/common/i18n/strings.g.dart';
import 'package:flutter_inappwebview_twodemo/common/utils/config.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/appcenter/pages/appcenter_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/front/pages/front_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/im/pages/im_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/news/pages/news_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/profile/pages/profile_page.dart';
import 'package:flutter_inappwebview_twodemo/feature/navigation/app_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// 混入AutomaticKeepAliveClientMixin是为了保持HomeWidgets防止在弹出其他窗口或切换视窗后，导致dispose失去状态，也防止每次进入都要初始化状态
class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 状态保持

  int _index = 2;

 final PageController _controller = PageController();

// bottom
  final List<MenuData> menus = [
    MenuData(label: t.tab.news, icon: AppIcons.news),
    MenuData(label: t.tab.message, icon: AppIcons.message),
    MenuData(label: '师大中心',icon: AppIcons.hunnu),
    MenuData(label: t.tab.app, icon: AppIcons.app),
    MenuData(label: t.tab.profile, icon: AppIcons.profile),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用父类的该方法，以便 mixin 能正常工作

    // 获取设备屏幕的大小，进行适配
    var viewSize = MediaQuery.of(context).size;
    var bw = viewSize.width / 6; // 计算基础宽度（base width），将其设定为屏幕宽度的六分之一
    var padding = viewSize.width /
        Config.windowGrids; // 根据屏幕宽度和自定义配置Config.windowGrids计算间距（padding）
    var iconSize = bw * 0.4;
    var textSize = bw * 0.2;
    var centralIconSize = bw * 0.65; // 让navigationbar中间FrontPage的Icon显示的更大

    return Scaffold(
        body: _buildContent(),
        bottomNavigationBar: AppBottomBar(
          menus: menus,
          currentIndex: _index,
          onItemTap: _onChangePage,
        ));
  }

  Widget _buildContent() {
    return PageView(
      physics:
          NeverScrollableScrollPhysics(), //禁止用户手动滑动切换页面，页面间的切换只能通过点击ButtomBar控制
      controller: _controller, //控制 PageView 的行为,下面方法的jumpToPage就是用来跳转页面
      children: const [
        NewsPage(),
        IMPage(),
        FrontPage(),
        AppcenterPage(),
        ProfilePage(),
      ],
    );
  }

// 回调函数，当页面发生改变时会被调用
  void _onChangePage(int index) {
    _controller.jumpToPage(index);
    // 更新Widget状态，根据_index设置按钮效果
    setState(() {
      _index = index;
    });
  }

}
