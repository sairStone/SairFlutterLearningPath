# flutter_app_idcardnew

A new Flutter project.

自定义组件，使用实体模型创建对象

## Getting Started

简单梳理一下该案例的流程：

1.创建一个flutter项目

2.准备好静态文件，在pubspec.yaml中设置assets路径

3.创建Scaffold（）这个Widget

4.新建entity目录，在其下创建card.dart文件夹

5.创建card.dart模型

6.新建componets文件夹，创建idcard.dart这个自定义组件

7.在main.dart中创建card类型的列表List来存放对象数据

8.在body中使用ListView组件来使用的IdCard组件

9.自定义的IdCard()组件需要接受card对象

```dart
///核心代码：
///自定义类
class StuCard {
  String avator;
  String name;
  int star;

  StuCard({
    required this.avator,
    required this.name,
    required this.star,
  });

}  

/// StuCard类型对象
List<StuCard> stuCards = [
    StuCard(avator: 'avator1.jpg', name: 'Sair', star: 1),
    StuCard(avator: 'avator2.jpg', name: 'Fan', star: 2),
  ];

/// 列表遍历展示
    body: ListView.builder(
          itemCount: stuCards.length,
          itemBuilder: (BuildContext context, int index) {
            return IdCard(stuCards[index]);
          }, 
        
        
```

