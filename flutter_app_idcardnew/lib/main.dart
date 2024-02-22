import 'package:flutter/material.dart';
import 'package:flutter_app_idcardnew/componets/idcard.dart';
import 'package:flutter_app_idcardnew/entity/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StuCard> stuCards = [
    StuCard(avator: 'avator1.jpg', name: 'Sair', star: 1),
    StuCard(avator: 'avator2.jpg', name: 'Fan', star: 2),
  ];

  @override
  Widget build(BuildContext context) {
    /// 这是 有状态 State组件 Scaffold不用const
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text(
            'Sair\'s IdCard',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: ListView.builder(
          itemCount: stuCards.length,
          itemBuilder: (BuildContext context, int index) {
            return IdCard(stuCards[index]);
          },
        ));
  }
}

/*
ListView组件和ListView.builder的区别：
ListView(
  children: stuCards.map((e) => IdCard(e)).toList(),
)
用 map 方法遍历 stuCards 列表，并将其中的每一个 StuCard 对象转换成一个 IdCard 组件。然后，我们使用 toList 方法将所有的 IdCard 组件转换为一个列表，再将该列表作为 ListView 组件的子组件进行展示。

ListView.builder(
  itemCount: stuCards.length,
  itemBuilder: (BuildContext context, int index) {
    return IdCard(stuCards[index]);
  },
)
ListView.builder 来根据 stuCards 列表的长度动态构建多个 IdCard 组件。itemCount 属性指定了列表项的数量，而 itemBuilder 属性指定了根据索引返回对应的 IdCard 组件的逻辑。这样就可以实现在 IdCard 中传入对象并且以遍历的形式动态构建多个组件。
*/

//使用 ListView.builder 来动态构建多个 IdCard 组件，则可以避免一次性展示所有的组件，从而提升性能和用户体验。而如果您使用 ListView 来展示所有的组件，则可能会导致性能问题。