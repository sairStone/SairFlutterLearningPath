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

// ...
// StatefulWidget此类扩展 State，因此可以管理其自己的值。
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); //_MyHomePageState 开始部分的下划线 (_) 将该类设置为私有类，并由编译器强制执行。
}

class _MyHomePageState extends State<MyHomePage> {
// 新的有状态 widget 只需要跟踪一个变量，即 selectedIndex
  var selectedIndex = 0; // 状态更改 1

  @override
  Widget build(BuildContext context) {
    Widget page; //声明了一个类型为 Widget 的新变量 page
    // 根据 selectedIndex 中的当前值，switch 语句为 page 分配一个屏幕
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
       // Placeholder；这是一个便捷易用的 widget，可以在其放置地方绘制一个交叉矩形，以便将界面的该部分标记为未完成。
        // page = Placeholder();
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

// LayoutBuilder。它允许根据可用空间大小来更改 widget 树. 添加 constraints 参数
// 每当约束发生更改时，系统都会调用 LayoutBuilder 的 builder 回调。比如说，以下场景就会触发这种情况：
// 用户调整应用窗口的大小
// 用户将手机从人像模式旋转到横屏模式，或从横屏模式旋转到人像模式
// MyHomePage 旁边的一些 widget 变大，使 MyHomePage 的约束变小
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              // SafeArea 将确保其子项不会被硬件凹口或状态栏遮挡
              // 在此应用中，widget 会将 NavigationRail 封装，以防止导航按钮被遮挡，例如被移动状态栏遮挡。
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                 // extended: false, // extended: false 行更改为 true。这将显示图标旁边的标签
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  // selectedIndex: 0, // 若选定索引 (selectedIndex) 为零，则会选择第一个目标页面。目前，它被硬编码为零。
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;    // ← 状态更改 3
                    });
                    // print('selected: $value');
                  },
                  selectedIndex: selectedIndex, // ← 状态更改 2

                ),
              ),
              // Expanded widget 在展开的 widget 在行和列中极具实用性，它会尽可能多地占用其余空间，是“贪婪的”元素
              // 如果有两个 Expanded widget 会分割两者之间所有可用的水平空间，即使侧边导航栏只需要左侧的一小部分。
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ...

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


// 添加第二个页面

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 context.watch<MyAppState>() 从任何 widget 访问 MyAppState 实例。
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

// 用 ListView widget,实现可滚动的 Column
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        // 使用 ListTile 的 title（通常用于文本）、leading（用于图标或头像）和 onTap（用于交互）
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
          // Dart 还支持编写 messages.map((m) => Text(m)).toList() 用来替换 for in
      ],
    );
  }
}