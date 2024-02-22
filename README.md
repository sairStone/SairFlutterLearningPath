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



Flutter官网学习：https://flutter.cn/

学习构建第一个Flutter应用：https://codelabs.developers.google.com/codelabs/flutter-codelab-first?hl=zh-cn#1

```dart
///main.dart 认识基础 Widget
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {           // ← 1
    var appState = context.watch<MyAppState>();  // ← 2

    return Scaffold(                             // ← 3
      body: Column(                              // ← 4
        children: [
          Text('A random AWESOME idea:'),        // ← 5
          Text(appState.current.asLowerCase),    // ← 6
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          ),
        ],                                       // ← 7
      ),
    );
  }
}

// ...
```

最后是 `MyHomePage`，这是您已经修改过的 widget。下面每个带编号的行均映射到上面代码中相应行编号的注释：

1. 每个 widget 均定义了一个 `build()` 方法，每当 widget 的环境发生变化时，系统都会自动调用该方法，以便 widget 始终保持最新状态。
2. `MyHomePage` 使用 `watch` 方法跟踪对应用当前状态的更改。
3. 每个 `build` 方法都必须返回一个 widget 或（更常见的）嵌套 widget 树。在本例中，顶层 widget 是 `Scaffold`。
4. `Column` 是 Flutter 中最基础的布局 widget 之一。它接受任意数量的子项并将这些子项从上到下放在一列中。默认情况下，该列会以可视化形式将其子项置于顶部。
5. 您在第一步中更改了此 `Text` widget。
6. 第二个 `Text` widget 接受 `appState`，并访问该类的唯一成员 `current`（这是一个 `WordPair`）。`WordPair` 提供了一些有用的 getter，例如 `asPascalCase` 或 `asSnakeCase`。此处，我们使用了 `asLowerCase`。但如果您希望选择其他选项，您现在可以对其进行更改。
