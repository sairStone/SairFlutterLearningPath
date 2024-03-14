// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuData {
  final String? label; // buttomBar lable name
  final IconData icon; // buttomBar icon

  MenuData({
    this.label,
    required this.icon,
  });
}

class AppBottomBar extends StatelessWidget {

  final int currentIndex;
  final List<MenuData> menus;
  final ValueChanged<int>? onItemTap;

  const AppBottomBar({
    Key? key,
    this.currentIndex = 2,  // 默认的选中的Page,从0开始，也就是第三个page
    required this.menus,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: onItemTap,
      currentIndex: currentIndex,
      elevation: 3,
      type: BottomNavigationBarType.fixed,
      iconSize: 22,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: menus.map(_buildItemByMenus).toList());
  }

  BottomNavigationBarItem _buildItemByMenus(MenuData menu){
    return BottomNavigationBarItem(label: menu.label, icon: Icon(menu.icon));
  }

}
