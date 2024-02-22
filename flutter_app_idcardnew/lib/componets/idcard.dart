/// 这是封装的IdCard组件，只要在main.dart文件中调用 IdCard方法，然后传card对象既可以实现
import 'package:flutter/material.dart';
import 'package:flutter_app_idcardnew/entity/card.dart';

class IdCard extends StatefulWidget {
  /// 将 main传递过来的 StuCard e 赋值给类的成员变量，否则导致在 Text 组件中无法获取到变量 e 中的属性值 name
  final StuCard e;

  ///当定义一个类的构造函数时，使用大括号 {} 包裹参数表示这些参数是可选的命名参数。
  ///如果将 this.e 放在大括号内部，则表示 e 是一个可选的命名参数；如果不放在大括号内部，则表示 e 是一个必填的位置参数。
  const IdCard(this.e, {super.key});  /// this.e接收从外部传入的card对象,传给上面的 final StuCard e;

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  void increse() {
    setState(() {
      /// 组件内部引用类的成员变量时，需要通过 widget 属性来获取父组件传入的数据
      /// 需要使用 widget.e.name 来访问 IdCard 类中的成员变量，而不能直接使用 e.name。
      widget.e.star += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/${widget.e.avator}'),
                radius: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${widget.e.name}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Star',
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${widget.e.star}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    increse();
                  },
                  icon: Icon(Icons.star),
                  label: Text('star'))
            ],
          ),
          Divider(
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
