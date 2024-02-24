# flutter_app_worldtime

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

- **http**：发出 HTTP 请求的库
- **intl**：提供国际化与本地化设施，包括信息翻译、复数和性别、日期/数字格式化和解析以及双向文本。比如**DateFormat**用来将日期格式化
- **flutter_spinkit**：加载动画集合
- **logging：**日志记录，用来代替显性的print( )输出，需要配置日志等级



本项目主要学习内容：

```dart
 /// main.dart 默认加载路由
@override
 Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Loading(),
        '/home' :(context) => Home(),
      }
    );
  }

/// main.dart 按钮的简单跳转
 dynamic result = await Navigator.pushNamed(context, '/location');

/// choose_location.dart 代参路由的跳转  
/// 路由规则： https://dart.dev/tools/linter-rules/use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });

/// StatefulWidget InitState生命周期的重写
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


/// world_time.dart 请求http
   Uri ur = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
   http.Response response = await http.get(ur);

 // 以json的方式存储接口数据
   Map data = jsonDecode(response.body);
```



### Logging 包

使用`logging`框架来代替`print`语句输出日志。这样，可以更方便地控制日志的等级、格式和输出方式。

首先，在`pubspec.yaml`文件中添加`logging`依赖：

```yaml
dependencies:
  logging: ^1.0.1
```

然后，在需要记录日志的文件中，导入`logging`包，并定义一个Logger对象：

```dart
import 'package:logging/logging.dart';

final Logger logger = Logger('MyApp');
```

在上面的例子中，我们定义了一个名为`MyApp`的Logger对象。

接下来，在程序的入口处（如`main`函数）设置日志的默认级别和输出方式：

```dart
void main() {
  Logger.root.level = Level.ALL; // 设置根Logger的日志级别
  Logger.root.onRecord.listen((record) {
    print('${record.time} [${record.level.name}] ${record.loggerName}: ${record.message}');
  }); // 设置根Logger的输出方式
  runApp(MyApp());
}
```

在上面的代码中，我们将根Logger的日志级别设置为ALL，这意味着所有的日志信息都会被记录下来。然后，我们使用`onRecord`方法设置根Logger的输出方式，这里我们输出了日志的时间、级别、Logger名称和消息内容。

现在，我们就可以在需要记录日志的地方，使用Logger对象的`fine`、`info`、`warning`、`severe`等方法来记录不同级别的日志了。例如：

```dart
void fetchData() async {
  http.Response response = await http.get('https://example.com/api/data');
  logger.info('Response: ${response.body}');
}
```

在上面的例子中，我们使用Logger对象的`info`方法记录了一个信息级别的日志，输出了响应的body内容。

这样，就可以用`logging`框架来代替`print`语句输出日志了。通过设置Logger的级别和输出方式，可以更方便地控制日志的输出。
