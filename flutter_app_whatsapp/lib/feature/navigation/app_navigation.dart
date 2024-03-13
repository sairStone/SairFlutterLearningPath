import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/feature/auth/pages/login_page.dart';
import 'package:flutter_app_whatsapp/feature/news/news_page.dart';
import 'package:flutter_app_whatsapp/feature/welcome/pages/welcome_page.dart';

import 'app_bottom_bar.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _index = 0;
  final PageController _ctrl = PageController();

  final List<MenuData> menus = const [
    MenuData(label: '新闻', icon: Icons.new_releases_sharp),
    MenuData(label: '欢迎页', icon: Icons.try_sms_star_rounded),
    MenuData(label: '登录', icon: Icons.login),
    // MenuData(label: '网络文章', icon: Icons.article_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      bottomNavigationBar: AppBottomBar(
        currentIndex: _index,
        onItemTap: _onChangePage,
        menus: menus,
      ),
    );
  }

  void _onChangePage(int index) {
    _ctrl.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }

  Widget _buildContent() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _ctrl,
      children: const [
        NewsPage(),
        WelcomePage(),
        LoginPage(),
        // VerificationPage(),
      ],
    );
  }
}