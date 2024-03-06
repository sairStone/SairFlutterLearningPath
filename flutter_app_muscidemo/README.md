# flutter_app_muscidemo

A new Flutter project.

## Getting Started

### 1.项目思路

这个音乐播放demo有两个页面，一个是PLAYList PAGE，一个是SONG PAGE

PlayList Page 功能 list of songs

Song Page 功能 current song / play /pasue / resume /seek

此外，该项目需要具备日夜切换功能，需要有Settingo 用来设置 Theme



### 2.项目结构

**lib**

- pages
  - home_page.dart
  - setting_page.dart
- themes
  - light_mode.dart
  - dark_mode.dart
  - theme_provider.dart
- components
  - my_darawer.dart



### 3.关键代码

```dart
// light_mode.dart & dark_mode.dart

Colors.grey.shade900,600,800,300

ThemeData lightMode = ThemeData(
	colorScheme: ColorScheme.light(
    	backgroud:
        primary:
        secondary:
        inversePrimary:
    ),
);

// 未使用provider库的使用方法
backgroundColor: Theme.of(context).colorScheme.background
    
// theme_provider.dart
class ThemeProvider extends ChangeNotifier{
    // initially,light mode
    ThemeData _themeData = lightMode;
    
    // get theme
    ThemeData get themeData => _themeData;
    // 相当于 ThemeData get themeData(){ return _themeData; }
    
    // is dark mode
    bool get isDarkMode => _themeData == darkMode;
    
    // set theme
    set themeData(ThemeData themeData){
        _themeData = themeData;
        
        // updata ui
        notifyListners();
    }
    
    // toggle theme
    void toggleTheme(){
        if(_themeData == lightMode){
            themeData = darkMode;
        }else{
            themeData = lightMode;
        }
    }
}

//使用provider库的使用方法
theme: Provider.of<ThemeProvider>(context).themeData,

// get：这是Dart中的一个关键字，用于定义一个getter方法。getter是一种特殊的方法，用于读取对象的属性。与普通方法不同，调用getter时不需要使用括号。
```

```dart
// my_drawer.dart
Drawer(
	ListTitle(
    	title: Text
        leading: Icon
        onTap:(){ 
            Nvaigator.pop(context);
            Nvaigator.push(contxt,MaterialPageRoute( builder:(context) => SettingsPage() ))    
                }
    )
)
```

