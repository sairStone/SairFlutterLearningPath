// 该 flu03实现了一个简单的静态的IDCard，尝试了布局(Column、row)和一些组件（Avatar、Text）
// flu04我们将尝试使用Statefulwidget，然后去自定义组件实现该IDCard

import 'package:flutter/material.dart';

var name = 'Sair'; // 无法再下面用 $进行使用,需要statefulWidget组件才行

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sair IdCard',
      debugShowCheckedModeBanner: false, // 去除掉右上角的debug标志
      home: IdCard(),
    );
  }
}

class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title:
            const Text('Sair\'s IdCard', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(40), // 内边距,然后 margin是外边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avator1.jpg'), // 在pubspec.yaml中配置assets目录
                radius: 50,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /// 这是分割线，height是下划线占据的高度，thickness才能跳转下划线的粗细，color可以调整颜色
            Divider(
              height: 20,
            ),
            /// SizedBox通常用来做占位空间，进一步也可以在里面通过child添加widget,但没法超过SizedBox的高度和宽度
                SizedBox(
              height: 20,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
            Text(
              'Sair', // 因为是StatelessStateWidget,所以在外如果定义了name属性，无法通过 ${name} 来使用
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Gender',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
            Text(
              'Man',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            // 下面再Coulum 中使用了Row 布局，将icon和 text放在一排里面
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Email',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
            Text(
              '2126322064@qq.com',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
