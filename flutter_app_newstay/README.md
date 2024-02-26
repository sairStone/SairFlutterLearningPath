# flutter_app_newstay

一个查看世界时间的app应用。

需实现：

- main.dart：实现路由跳转，先跳转到 **loading页面**，用来加载获取**api**之前的时间，然后再从**loading页面**跳转到home页面，默认展示**Asia/Shanghai**的时间，从改页面可以点击按钮跳转去**choose_location页面**选择不同地区，获取不同地球的时间，再返回**路由参数**到home页面上。
- pages：
  - loading.dart：需要实现world_time.dart的对象，来获取api
  - home.dart：展示时间，编写界面UI,根据是否白天切换背景图片
  - choose_location.dart：需要实现WorldTime对象，使用LIst相关信息，ListView展示卡片
- model
  - world_time.dart：实体模型



https://pub.dev 网站获取如下包：

- **provider**：简化的资源分配与处置，创建新类时减少大量的模板代码，提升类的可扩展性
- **english_words**：随机生成英语单词



**小提示：**若要获取可以更改的完整属性列表，请将光标放在 `调用方法()` 括号内的任意位置，然后按下 `Ctrl+Shift+Space` 键 (Win/Linux) 或 `Cmd+Shift+Space` 键 (Mac)。



本项目主要学习内容：

```dart
// https://codelabs.developers.google.com/codelabs/flutter-codelab-first?hl=zh-cn#3

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

1. 每个 widget 均定义了一个 `build()` 方法，每当 widget 的环境发生变化时，系统都会自动调用该方法，以便 widget 始终保持最新状态。
2. `MyHomePage` 使用 `watch` 方法跟踪对应用当前状态的更改。
3. 每个 `build` 方法都必须返回一个 widget 或（更常见的）嵌套 widget 树。在本例中，顶层 widget 是 `Scaffold`。您不会在此 Codelab 中使用 `Scaffold`，但它是一个有用的 widget。在绝大多数真实的 Flutter 应用中都可以找到该 widget。
4. `Column` 是 Flutter 中最基础的布局 widget 之一。它接受任意数量的子项并将这些子项从上到下放在一列中。默认情况下，该列会以可视化形式将其子项置于顶部。您很快就会对其进行更改，使该列居中。
5. 您在第一步中更改了此 `Text` widget。
6. 第二个 `Text` widget 接受 `appState`，并访问该类的唯一成员 `current`（这是一个 `WordPair`）。`WordPair` 提供了一些有用的 getter，例如 `asPascalCase` 或 `asSnakeCase`。此处，我们使用了 `asLowerCase`。但如果您希望选择其他选项，您现在可以对其进行更改。
7. 请注意，Flutter 代码大量使用了尾随逗号。此处并不需要这种特殊的逗号，因为 `children` 是此特定 `Column` 参数列表的最后一个（也是唯一一个）成员。不过，在一般情况下，使用尾随逗号是一种不错的选择。尾随逗号可大幅减小添加更多成员的必要性，并且还可以在 Dart 的自动格式化程序中作为添加换行符的提示。如需了解详细信息，请参阅[代码格式](https://docs.flutter.dev/development/tools/formatting)。



```dart
// 本人看着图片写下的UI

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            pair.asLowerCase,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ), //负责显示当前单词
        ));
  }
}


// 教程的使用Card组件和them样式实现的UI

@override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),

        // ↓ Make the following change.
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
```

**色彩使用**：Flutter 的 `Colors` 类可让您方便地访问精选颜色的调色板，例如 `Colors.deepOrange` 或 `Colors.red`。不过，您当然可以选择任何颜色。例如，要定义完全不透明的纯绿色，请使用 `Color.fromRGBO(0, 255, 0, 1.0)`。如果您喜欢使用十六进制数，也可以使用 `Color(0xFF00FF00)`。



```dart
// 添加了一个名为 favorites 的新属性。此属性使用一个空的列表进行初始化
// 使用 泛型 generics 指定该列表只能包含单词对：<WordPair>[]。这有助于增强应用的可靠性 — 如果您尝试向应用添加 WordPair 以外的任何内容，Dart 甚至会拒绝运行应用。
  var favorites = <WordPair>[];
```

**注意**：除了 `List`（用 `[]` 表示）以外，Dart 还提供了其他一些集合类型。您可能认为 `Set`（用 `{}` 表示）可以更有效地表示收藏夹集合。为了让此 Codelab 保持尽可能简单易懂，我们仍然坚持使用了列表。但如果需要，您可以改为使用 `Set`。代码不会有太大变化。



```dart
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp()); // 告知 Flutter 运行 MyApp 中定义的应用
}

// 在构建每一个 Flutter 应用时，widget 都是一个基本要素
// 应用本身也是一个 widget。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// 这是旧版的MyHomePage，在正式的main.dart文件中为了进一步提高功能性，进行了重新构造

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 每个Widget都定义了一个
    var appState =
        context.watch<MyAppState>(); // MyHomePage 使用 watch 方法跟踪对应用当前状态的更改
    var pair = appState.current; // 不建议在Widget里直接使用 appState，所以在此提取

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      // 每个 build 方法都必须返回一个 widget 或（更常见的）嵌套 widget 树。
      body: Center(
        child: Column(
          // 最基础的布局 widget 之一
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random AWESOME idea:'),
            SizedBox(height: 50),
            BigCard(pair: pair), // Text widget 接受 appState，并访问该类的唯一成员 current
            SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min, // 告知 Row 不要占用所有可用的水平空间,可以尝试一下max
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      appState.toggleFavorite();
                    },
                    icon: Icon(icon),
                    label: Text('Like')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ], // ← 7
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

/*
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 250,
        // 使用Container组件的装饰效果
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            pair.asLowerCase,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ), //负责显示当前单词
        ));
  }
  */

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 使用 Theme.of(context) 请求应用的当前主题。

// 使用 theme.textTheme,访问应用的字体主题。
// 此类包括以下成员：bodyMedium（针对中等大小的标准文本）、caption（针对图片的说明）或 headlineLarge（针对大标题）。
    // displayMedium 属性是专用于“展示文本”的大号样式,此外由于dart使用null安全机制，所以需要使用 ! 运算符（“bang 运算符”）向 Dart 保证您知道自己在做什么
    // 调用 displayMedium 上的 copyWith() 会返回文本样式的副本，以及您定义的更改
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // 代码将卡片的颜色定义为与主题的 colorScheme 属性相同
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          // Text 的 semanticsLabel 属性，用更适合屏幕阅读器的语义内容来覆盖文本 widget 的视觉内容
          semanticsLabel:
              "${pair.first} ${pair.second}", // 该字符串插值替代 pair.asLowerCase，是为了防止屏幕阅读器连读，造成视障用户体验问题
        ),
      ),
    );
  }
}

// getNext() 方法为 current 重新分配了新的随机 WordPair。它还调用 notifyListeners() (ChangeNotifier) 的一个方法），
// 以确保向任何通过 watch 方法跟踪 MyAppState 的对象发出通知。
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners(); //notifyListeners() 是 ChangeNotifier 的一个方法
  }

// 添加了一个名为 favorites 的新属性。此属性使用一个空的列表进行初始化
// 使用 泛型 generics 指定该列表只能包含单词对：<WordPair>[]。这有助于增强应用的可靠性 — 如果您尝试向应用添加 WordPair 以外的任何内容，Dart 甚至会拒绝运行应用。
  var favorites = <WordPair>[];

// 添加了一个新方法 toggleFavorite()，它可以从收藏夹列表中删除当前单词对（如果已经存在），或者添加单词对（如果不存在）。
// 在任何一种情况下，代码都会在之后调用 notifyListeners();
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

```



**注：**`Wrap` 是一个类似于 `Row` 或 `Column` 的 widget，当没有足够的垂直或水平空间时，它会自动将子项封装到下一“行”（称为“运行”）中。`FittedBox` widget 可以自动根据您的规格将其子项放置到可用空间中。



**注意：**Flutter 使用逻辑像素作为长度单位。逻辑像素有时也称为**与设备无关的像素**。无论应用是在分辨率较低的旧款手机上运行，还是在新款“视网膜”设备上运行，8 像素的内边距在视觉上都是一样的。物理显示器每厘米大约有 38 个逻辑像素，相当于每英寸大约有 96 个逻辑像素。

