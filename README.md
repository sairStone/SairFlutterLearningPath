# SairFlutterLearningPath
记录2023年10月份开始的flutter学习经历



学习常用：

工具类：Vscode、Typora、git

网站类：Youtube、bilibili、稀土掘金、github、git



学习路线：Dart -> Flutter 



本人将学习时写的代码使用Github进行存储了，由于本人通常以如下在代码中写注释的方式进行学习，所以请看本仓库的**分支**。

> 本分支为: flu01-experience

```dart
/// flutter初体验 ：通过flutter:New Project 创建了一个Empty Application
/// 最简单的项目了，了解一下目录结构，声明式语法，基本函数

import 'package:flutter/material.dart';
//导入Flutter自带的 Material UI组件库 (提供了大量用于构建Material Design风格用户界面的组件和工具)
//导包语法：import 'package:包名/文件路径.dart' 。还支持 相对路径导入 和 使用别名进行命名空间控制 别名后面添加 as

void main() {
  //main函数，和java、C++那些一样，都是程序的入口
  runApp(const MainApp());
  //调用了runApp()函数，并创建了一个 MainApp的常量对象 作为参数
  // runApp()就是用来启动应用程序. 在源码中可以发现该函数 定义为：void runApp(Widget app)，所以MainAPP()就需要是一个Widget
}

//类 MainApp 继承自 StetelessWidget，也是一个 Widget, 但MyApp是一个自定义的Widget类，代表了整个应用程序的 根组件
  //Stateless是无状态改变的widget，与之相对的是StatefulWidget，用于需要保存状态，且可能出现状态改变
class MainApp extends StatelessWidget {

  const MainApp(
      {super.key}); // 该构造函数接受了一个参数key，super表示继承自父类，而key用于确定该widget在widget树中的唯一性的

//重写了 build() 函数，此函数用来构建和描述 Widget的UI界面 (根据Widget的状态生成新的Widget树)，该build()通常在第一次构建和状态更新才改变
//BuildContext是抽象对象，context是该对象的实例，context用来存储该widget的信息，可以帮助定位，获取父类、子类组件的位置，也可以传递路由参数、获取媒体信息
  @override
  Widget build(BuildContext context) {

    //返回了一个MaterialAPP对象，用来构建组件的材料，如标题 title，主页 home，路由 router等
    // 去看MaterialApp源码可以发现是继承自StatefulWidget，还有很多定义的组件和属性，会发现 title是String类型，而home是widget类型
    return const MaterialApp(
      title: 'flu01-experence',
      home: Scaffold(  //Scaffold继承自StatefulWidget，可以看到源码里有一堆定义好的组件，比如appbar,drawer之类的
        body: Center( //从这里就可以初步看作为的 html+css 了，但由于flutter都是widget,所以这些Center(),Text()都是widget
          child: Text(
            'SairFan: Hello Flutter!',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
```


│── .dart_tool/								- Flutter自动生成的配置和构建输出，一般不需要开发者去修改

│── .idea/										- IDEA的配置信息，不用管

├── android/                  - Android 原生项目文件夹

├── build/                    - 存放构建产物的文件夹，不用管

├── ios/                      - iOS 原生项目文件夹

├── lib/                      - ⭐存放Flutter源代码，大部分开发会在这个目录下进行

│   ├── main.dart             - ⭐Flutter 应用程序的主要入口

├── linux/										- Linux平台相关代码及配置文件

├── macos/										- Mac平台相关代码及配置文件

├── test/											- 测试文件

├── web/											- Web平台相关代码及配置文件

├── windows/									- Windows平台相关代码及配置文件

├── .metadata									- Dart编译器生成的元数据文件，包含有关项目的编译和依赖，metadata报错？报错直接删除让Dart重新编译

├── analysis_options.yaml			- 配置静态代码分析工具，可在此定义代码风格、禁用和启用特定警告和错误检查

├── hello_flutter.iml					- IntelliJ IDEA 项目文件文件，描述模块项目和依赖项，及其它配置信息，用于确保项目可以在 IntelliJ IDEA 或 Android Studio 中正确加载和编译。

├── pubspec.lock							- 项目依赖项的锁定信息，由pubspec.yaml自动生成，用于确保项目在不同环境使用相同的依赖项版本

└── pubspec.yaml              - ⭐ Flutter项目配置文件，包括依赖、插件、资源等


上面图录解释来自与稀土掘金的博主：
链接：https://juejin.cn/post/7301098227213139980
