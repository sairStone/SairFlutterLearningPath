
import 'package:flutter/material.dart';

// 当iconData没有显示出来，查看assets是否有包含icon的字体文件，再看yaml是否配置了
class AppIcons{
  static IconData get news {
    return const IconData(0xea92, fontFamily: 'iconfont');
  }

  static IconData get message {
    return const IconData(0xe6bc, fontFamily: 'iconfont');
  }

  static IconData get profile {
    return const IconData(0xe66a, fontFamily: 'iconfont');
  }

  static IconData get app {
    return const IconData(0xe62f, fontFamily: 'iconfont');
  }

  static IconData get hunnu {
    return const IconData(0xe603, fontFamily: 'iconfont');
  }

  static IconData get chat {
    return const IconData(0xe610, fontFamily: 'iconfont');
  }

  static IconData get contacts {
    return const IconData(0xe652, fontFamily: 'iconfont');
  }

  static IconData get scan {
    return const IconData(0xe66d, fontFamily: 'iconfont');
  }

  static IconData get ecard {
    return const IconData(0xe6b4, fontFamily: 'iconfont');
  }
}