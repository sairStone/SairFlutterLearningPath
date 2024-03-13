import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/themes/dark_theme.dart';
import 'package:flutter_app_muscidemo/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier{
  // init light mode
  ThemeData _themeData = lightMode;

  // get 'theme'
  ThemeData get themeData => _themeData;

  // get' is dart mode'
  bool get isDarkMode => _themeData == darkMode;

  // set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    // updata ui
    notifyListeners();
  }

  // toggle theme
  void toggleTheme(){
    if(_themeData == lightMode){
      // 下面的 themeData 不能设置为私有访问修饰的
       themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }

}