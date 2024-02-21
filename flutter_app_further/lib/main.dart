import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // 这句话说明 MyApp是整个应用的根组件，由重写的build函数进行构建
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 下面意思是尝试去使用该 MaterialApp的方法进行切换theme和color,改变 UI的视觉效果，然后热加载，就是vscode右上角那个闪电符号
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // 这里构建函数接受了两个参数，title就是上面调用该函数传递的参数

  // 说明这是 应用的主页，是一个有状态的组件，有状态对象，
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title; // 在这些子类Widget定义的字段通常用 'final'修饰，要求 其声明的变量在赋值之后就不再改变

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // 有状态变化的Widget，重写 createState() 返回一个 具体的状态实现类，该类继承 State<组件类名> ，
  // 例如该类中有可调用 setStgate() ，每次调用就会通知 Flutter框架，然后有状态改变，就需要调用build()重新构建页面。
}

//类名前的 下划线 _ 用于标识类是一个私有类，不能在其它文件中访问
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 定义了私有变量，可以修改

  void _incrementCounter() {
    setState(() {
      // setState() 是StatefulWidget类提供的函数，用于 通知Flutter框架有状态发生改变，
      // Flutter收到通知后，会执行 build() 函数来 根据新的状态重新构建页面.

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decreaseCounter(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
     // 重写 build() 用于返回一个具体的Widget或复杂的Widget组合；
    // build() 函数可以第一次运行时构建组件树，也在后面每一次点击按钮触发setState状态改变后，根据新的状态重新构建
    // 这也是 StatefulWidget独有的效果，当然会更消耗的计算，所以不能改变的组件还是用statelesswidget更好！

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // build() 函数返回一个 Scaffold 组件 (页面脚手架) ，从源码中看，可以发现
    // 提供了 appBar(顶部栏)、body(内容部分)、floatingActionButton(悬浮按钮)、bottomNavigationBar(底部导航栏)、drawer(侧边栏) 等属性。
    return Scaffold(

      appBar: AppBar(
        // 表示可以去修改下面的属性内容，尝试看 UI的改变
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        // 都是 widget, Center这个Widget有一个子 Widget Column
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column() 和 Row() 都是布局widget,用来进行 页面布局
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

    // floatingActionButton 与 body是同一层次
    // 在这里我们给 再添加一个 FloatingActionButto 用来对_counter进行减少，
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            onPressed: _decreaseCounter,
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),

    );
  }
}

//该简单应用的逻辑就是：点击按钮后调用_incrementCounter() → counter自增 → setState() 通知Flutter框架状态发生变化 → Flutter框架调用 build() 函数以新的状态重新构建UI → 显示到设备屏幕上。