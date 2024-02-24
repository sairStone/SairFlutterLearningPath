import 'package:flutter/material.dart';
import 'package:flutter_app_worldtime/pages/choose_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  toChooseLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseLocation()), // 替换为目标页面的实际类名
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 从上下文中获取路由参数
    /// ModalRoute.of(context)方法获取当前页面的路由对象，settings属性获取路由的配置信息，再转换为Map<String, dynamic>类型的数据
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    Map<String, dynamic> data =
        // ignore: unrelated_type_equality_checks
        arguments != {} ? Map<String, dynamic>.from(arguments) : {};

    // set background image，三元运算符
    String bgImage = data['isDaytime'] == 'true' ? 'day.png' : 'night.png';
    Color? bgColor =
        data['isDaytime'] == 'true' ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        /// BoxDecoration是Flutter中用来装饰容器的类，通过它可以设置容器的背景、边框、阴影等样式。
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover, /// BoxFit.cover表示将图片等比例拉伸并覆盖整个容器
         )
        ),
        child: Column(
          children: [
            const SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                      onPressed: () {
                        toChooseLocation();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 15,
                          ),
                          Text('To Choose Location')
                        ],
                      )
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${data['location']}',
              style: const TextStyle(fontSize: 25,color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${data['time']}',
              style: const TextStyle(fontSize: 50,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
