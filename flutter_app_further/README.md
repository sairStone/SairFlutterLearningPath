# flutter_app_further

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



上面是创建时生成的typora文件



认识目录：

```
flutter_app_further/
│── .dart_tool/				    - Flutter自动生成的配置和构建输出，一般不需要开发者去修改
│── .idea/					    - IDEA的配置信息，不用管
├── android/                    - Android 原生项目文件夹
├── build/                      - 存放构建产物的文件夹，不用管
├── ios/                        - iOS 原生项目文件夹
├── lib/                        - ⭐存放Flutter源代码，大部分开发会在这个目录下进行
│   ├── main.dart               - ⭐Flutter 应用程序的主要入口
├── linux/					    - Linux平台相关代码及配置文件
├── macos/					    - Mac平台相关代码及配置文件
├── test/						- 测试文件
├── web/						- Web平台相关代码及配置文件
├── windows/					- Windows平台相关代码及配置文件
├── .metadata					- Dart编译器生成的元数据文件，包含有关项目的编译和依赖，metadata报错？报错直接删除让Dart重新编译
├── analysis_options.yaml	    - 配置静态代码分析工具，可在此定义代码风格、禁用和启用特定警告和错误检查
├── hello_flutter.iml			- IntelliJ IDEA 项目文件文件，描述模块项目和依赖项，及其它配置信息，用于确保项目可以在 IntelliJ IDEA 或 Android Studio 中正确加载和编译。
├── pubspec.lock				- 项目依赖项的锁定信息，由pubspec.yaml自动生成，用于确保项目在不同环境使用相同的依赖项版本
└── pubspec.yaml                - ⭐ Flutter项目配置文件，包括依赖、插件、资源等

```



认识配置参数**pubspec.yaml**

```yaml
name: hello_flutter # 项目名称
description: A new Flutter project..  #项目描述
publish_to: 'none' # 防止上传到pub.dev   这个类似与maven

version: 1.0.0+1  # 版本号 → 前面是版本名字 +1是第一个版本

environment:	# 定义程序所需的环境
  sdk: '>=3.1.5 <4.0.0' # 程序所需Dart SDK的版本范围


dependencies: # 程序所依赖的外部库
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^1.1.0  # 添加http依赖库

dev_dependencies: # 开发时的依赖包，一般是测试框架之类
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0

flutter:  # Flutter特定字段，比如配置
  uses-material-design: true  # 是否启用 Material Design 风格
  assets:
  - assets/ 


```

上图来源自稀土掘金

作者：coder_pig
链接：https://juejin.cn/post/7301098227213139980
