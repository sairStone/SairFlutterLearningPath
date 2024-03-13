// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {

  final VoidCallback onCheck;
  final TextEditingController controller;


  GuessAppBar({
    super.key,
    required this.onCheck,
    required this.controller,
  });

// appBar 接受的是 {PreferredSizeWidget? appBar} Type: PreferredSizeWidget? 所以需要覆写
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 通过systemOverlayStyle入参控制状态栏和导航栏的信息。
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
      title: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF3F6F9),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          hintText: '请输入 0-99 数字',
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
      actions: [
        IconButton(
          // 使用匿名函数时，您可以在函数内部执行更多的操作，而不仅仅是调用 _onCheck 方法。
          // onPressed: () {
          //   _onCheck();
          // },

          // 直接引用方法是一种更简洁的方式，直接将 _onCheck 方法作为回调传递给 onPressed，当按钮按下时会直接调用 _onCheck 方法。
          onPressed: onCheck,
          icon: Icon(
            Icons.run_circle,
            color: Colors.blueAccent,
            size: 30,
          ),
        ),
      ],
    );
  }
}
