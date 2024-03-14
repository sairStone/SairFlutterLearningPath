import 'package:flutter/material.dart';

class Coloors {
  Coloors._();

  static const Color greenDark = Color(0xFF00A884);
  static const Color greenLight = Color(0xFF008069);

  static const Color blueDark = Color(0xFF53ADEB);
  static const Color blueLight = Color(0xFF027EB5);

  static const Color greyDark = Color(0xFF8696A0);
  static const Color greyLight = Color(0xFF667781);

  static const Color backgroundDark = Color(0xFF111B21);
  static const Color backgroundLight = Color(0xFFFFFFFF);

 // 上升的语言单选列表
  static const Color greyBackground = Color(0xFF202C33);

  static const Color majorTheme = Color(0xFFEF5350);


  // 设置map类型的动态返回内容，按照键值对
  static Map _map = <String, dynamic>{};

    static int get _rawColor {
    return _map.putIfAbsent('color', () => 0xffc8161d);
  }

  static MaterialColor get primarySwatch {
    const baseColor = Colors.red;

    return MaterialColor(_rawColor, <int, Color>{
      50: baseColor.shade50,
      100: baseColor.shade100,
      200: baseColor.shade200,
      300: baseColor.shade300,
      400: Color(0xFFEF5350),
      500: baseColor.shade500,
      600: baseColor.shade600,
      700: baseColor.shade700,
      800: baseColor.shade800,
      900: baseColor.shade900,
    });
  }

  static Color get primaryColor {
    return Color(_rawColor);
  }
}
